import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/chat/data/model/call_chat_recorder_model.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/chat_mode_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/get_sahaara_endpoint_notifier.dart';
import 'package:sahaara/chat/presentation/screens/call_chat_screen.dart';
import 'package:sahaara/sessions/presentation/notifier/session_notifier.dart';

class CallChatRecorderNotifier extends Notifier<CallChatRecorderStateModel> {
  CallChatRecorderStateModel build() {
    return CallChatRecorderStateModel.initial();
  }

  static const int _silenceThreshold = 6;
  static const double _silenceMargin = 5.0;
  static const int _speechThreshold = 3;

  void _debugLog(String s) {
    log(s, name: 'CallChatRecorderNotiiferLogs');
  }

  void setIsBackgroundServiceRunning(bool val) {
    state = state.copyWith(isBackgroundServiceRunning: val);
  }

  void startRecording() async {
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    try {
      if (await state.audioRecorder.hasPermission()) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String recordingPath =
            '${appDocDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
        stopwatch.stop();
        _debugLog(
            'Started Recording...after ${stopwatch.elapsed.inSeconds} secs');
        if (ref.read(chatModeNotifier) == ChatMode.call) {
          await state.audioRecorder.start(
            const RecordConfig(encoder: AudioEncoder.aacEld),
            path: recordingPath,
          );
        } else {
          recorderController.record(path: recordingPath);
        }

        state = state.copyWith(recordingPath: recordingPath, isRecording: true);

        _calibrateBackgroundNoise();
      }
    } catch (e) {
      if (kDebugMode) {
        _debugLog('Error starting recording: $e');
      }
    }
  }

  void _calibrateBackgroundNoise() async {
    int samples = 0;
    double totalAmplitude = 0;
    _debugLog('Calibrating BG Noise');
    for (int i = 0; i < 20; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      final amplitude = await state.audioRecorder.getAmplitude();
      if (amplitude.current.isFinite) {
        totalAmplitude += amplitude.current;
        samples++;
      }
    }

    _debugLog('Updating BG Noise Level');
    if (samples > 0) {
      state = state.copyWith(backgroundNoiseLevel: totalAmplitude / samples);
    } else {
      state = state.copyWith(
          backgroundNoiseLevel: 60); // Default value if no valid samples
    }

    if (kDebugMode) {
      _debugLog(
          'Background noise level calibrated: ${state.backgroundNoiseLevel} dB');
    }

    _startAudioMonitoring();
  }

  void _startAudioMonitoring() {
    state.amplitudeTimer?.cancel();
    if (state.amplitudeTimer == null) {
      _debugLog('Starting to Monitor Audio');
      state = state.copyWith(
          amplitudeTimer:
              Timer.periodic(const Duration(milliseconds: 200), (timer) async {
        if (!state.isRecording) return;

        final amplitude = await state.audioRecorder.getAmplitude();
        if (amplitude.current.isFinite) {
          if (kDebugMode) {
            _debugLog('Current amplitude: ${amplitude.current} dB');
          }

          // Update peak amplitude
          if (amplitude.current > state.peakAmplitude) {
            state = state.copyWith(peakAmplitude: amplitude.current);
          }

          // Dynamic threshold based on peak amplitude and silence margin
          double dynamicThreshold = state.backgroundNoiseLevel +
              (state.peakAmplitude - state.backgroundNoiseLevel) * 0.3 +
              _silenceMargin;

          if (!state.speechDetected) {
            if (amplitude.current > dynamicThreshold) {
              state = state.copyWith(speechCounter: state.speechCounter + 1);
              // _speechCounter++;
              if (state.speechCounter >= _speechThreshold) {
                // _speechDetected = true;
                state = state.copyWith(speechDetected: true);
                if (kDebugMode) {
                  _debugLog('Speech detected, starting silence detection');
                }
              }
            } else {
              state = state.copyWith(speechCounter: 0);
            }
          } else {
            if (amplitude.current <= dynamicThreshold) {
              state = state.copyWith(silenceCounter: state.silenceCounter + 1);
              if (kDebugMode) {
                _debugLog('Silence detected. Counter: ${state.silenceCounter}');
              }
              if (state.silenceCounter >= _silenceThreshold) {
                if (kDebugMode) {
                  _debugLog('Stopping recording due to silence');
                }
                stopRecording();
              }
            } else {
              state = state.copyWith(
                  silenceCounter: 0,
                  backgroundNoiseLevel: (state.backgroundNoiseLevel * 0.95) +
                      (amplitude.current * 0.05));
              // _silenceCounter = 0;
              // Gradually adjust background noise level
              // _backgroundNoiseLevel =
              //     (_backgroundNoiseLevel * 0.95) + (amplitude.current * 0.05);
            }
          }
        }
      }));
    }
  }

  Future<void> stopRecording() async {
    state.amplitudeTimer?.cancel();
    if (!state.isRecording) return;
    String? path;
    if (ref.read(chatModeNotifier) == ChatMode.call) {
      path = await state.audioRecorder.stop();
    } else {
      path = await recorderController.stop();
      // _debugLog("Generated Path is: $path");
    }

    state = state.copyWith(
      isRecording: false,
      speechDetected: false,
      speechCounter: 0,
      silenceCounter: 0,
    );
    // setState(() {
    //   _isRecording = false;
    //   _speechDetected = false;
    //   _speechCounter = 0;
    //   _silenceCounter = 0;
    // });
    // widget.isRecording(false);

    if (kDebugMode) {
      _debugLog('Recording stopped. Path: $path');
    }

    if (path != null) {
      await _uploadFileToServer(path);
    }
  }

  Future<void> _uploadFileToServer(String filePath) async {
    try {
      ref.read(callChatNotifier.notifier).setIsGenerating(true);
      // await Future.delayed(4.seconds);
      // ref.read(callChatNotifier.notifier).setIsGenerating(false);

      // ref.read(callChatNotifier.notifier).setAudioUrlAndPlay(
      //     'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd');
      final uri = Uri.parse(
          // 'https://whxmgbtb-8000.inc1.devtunnels.ms/ask'
          '${ref.read(getSahaaraEndpointNotifier)}/ask');

      _debugLog('Uri: $uri');
      var request = http.MultipartRequest('POST', uri);
      var file = await http.MultipartFile.fromPath('file', filePath);
      request.files.add(file);
      String sessionId = ref.read(sessionNotifier).isEmpty
          ? '${ref.read(myUserNotifier).uid}_${DateTime.now().millisecondsSinceEpoch}'
          : ref.read(sessionNotifier);
      ref.read(sessionNotifier.notifier).setSessionId(sessionId);
      request.fields['session_id'] =
          sessionId;
      request.fields['uid'] = ref.read(myUserNotifier).uid;

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse)
          .timeout(6.seconds, onTimeout: () => Future.error(Error()));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        _debugLog('Respons: $jsonResponse');
        String audioUrl = jsonResponse['data']['audio_url'];

        _debugLog('received url as $audioUrl');
        ref.read(callChatNotifier.notifier).setIsGenerating(false);
        ref.read(callChatNotifier.notifier).setAudioUrlAndPlay(audioUrl);
        // ref.read(callChatNotifier.notifier).onRecordingComplete(audioUrl);
      } else {
        if (kDebugMode) {
          _debugLog(
              'Failed to upload file. Status code: ${response.statusCode} -- ${response.body}');
        }
        ref.read(callChatNotifier.notifier).setIsGenerating(false);
      }
    } catch (e) {
      if (kDebugMode) {
        _debugLog('Error uploading file: $e');
      }
      ref.read(callChatNotifier.notifier).setIsGenerating(false);
    }
  }
}

final callChatRecorderNotifier =
    NotifierProvider<CallChatRecorderNotifier, CallChatRecorderStateModel>(
        CallChatRecorderNotifier.new);
