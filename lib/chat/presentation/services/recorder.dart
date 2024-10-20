import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Recorder extends StatefulWidget {
  final void Function(String url) onRecordingComplete;
  final void Function(bool isRecording) isRecording;

  const Recorder({
    super.key,
    required this.onRecordingComplete,
    required this.isRecording,
  });

  @override
  RecorderState createState() => RecorderState();
}

class RecorderState extends State<Recorder> {
  final _audioRecorder = AudioRecorder();
  bool _isRecording = false;
  Timer? _amplitudeTimer;
  String? _recordingPath;
  double _backgroundNoiseLevel = -60.0;
  int _silenceCounter = 0;
  static const int _silenceThreshold = 6;
  static const double _silenceMargin = 5.0;
  double _peakAmplitude = -60.0;
  bool _speechDetected = false;
  int _speechCounter = 0;
  static const int _speechThreshold = 3;

  @override
  void initState() {
    super.initState();
  }

  Future<void> startRecording() async {
    if (!_isRecording) {
      await _start();
    }
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        _recordingPath =
            '${appDocDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

        await _audioRecorder.start(
          const RecordConfig(encoder: AudioEncoder.aacLc),
          path: _recordingPath!,
        );

        setState(() => _isRecording = true);
        widget.isRecording(true);
        _calibrateBackgroundNoise();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error starting recording: $e');
      }
    }
  }

  void _calibrateBackgroundNoise() async {
    int samples = 0;
    double totalAmplitude = 0;

    for (int i = 0; i < 20; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      final amplitude = await _audioRecorder.getAmplitude();
      if (amplitude.current.isFinite) {
        totalAmplitude += amplitude.current;
        samples++;
      }
    }

    if (samples > 0) {
      _backgroundNoiseLevel = totalAmplitude / samples;
    } else {
      _backgroundNoiseLevel = -60.0; // Default value if no valid samples
    }

    if (kDebugMode) {
      print('Background noise level calibrated: $_backgroundNoiseLevel dB');
    }

    _startAudioMonitoring();
  }

  void _startAudioMonitoring() {
    _amplitudeTimer?.cancel();
    _amplitudeTimer =
        Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      if (!_isRecording) return;

      final amplitude = await _audioRecorder.getAmplitude();
      if (amplitude.current.isFinite) {
        if (kDebugMode) {
          print('Current amplitude: ${amplitude.current} dB');
        }

        // Update peak amplitude
        if (amplitude.current > _peakAmplitude) {
          _peakAmplitude = amplitude.current;
        }

        // Dynamic threshold based on peak amplitude and silence margin
        double dynamicThreshold = _backgroundNoiseLevel +
            (_peakAmplitude - _backgroundNoiseLevel) * 0.3 +
            _silenceMargin;

        if (!_speechDetected) {
          if (amplitude.current > dynamicThreshold) {
            _speechCounter++;
            if (_speechCounter >= _speechThreshold) {
              _speechDetected = true;
              if (kDebugMode) {
                print('Speech detected, starting silence detection');
              }
            }
          } else {
            _speechCounter = 0;
          }
        } else {
          if (amplitude.current <= dynamicThreshold) {
            _silenceCounter++;
            if (kDebugMode) {
              print('Silence detected. Counter: $_silenceCounter');
            }
            if (_silenceCounter >= _silenceThreshold) {
              if (kDebugMode) {
                print('Stopping recording due to silence');
              }
              _stop();
            }
          } else {
            _silenceCounter = 0;
            // Gradually adjust background noise level
            _backgroundNoiseLevel =
                (_backgroundNoiseLevel * 0.95) + (amplitude.current * 0.05);
          }
        }
      }
    });
  }

  Future<void> _stop() async {
    _amplitudeTimer?.cancel();
    if (!_isRecording) return;

    final path = await _audioRecorder.stop();
    setState(() {
      _isRecording = false;
      _speechDetected = false;
      _speechCounter = 0;
      _silenceCounter = 0;
    });
    widget.isRecording(false);

    if (kDebugMode) {
      print('Recording stopped. Path: $path');
    }

    if (path != null) {
      await _uploadFileToServer(path);
    }
  }

  Future<void> _uploadFileToServer(String filePath) async {
    try {
      final uri = Uri.parse('https://whxmgbtb-3000.inc1.devtunnels.ms/ask');
      var request = http.MultipartRequest('POST', uri);
      var file = await http.MultipartFile.fromPath('file', filePath);
      request.files.add(file);

      request.fields['uid'] = 'rohitranjan20';

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        String audioUrl = jsonResponse['public_url'];
        widget.onRecordingComplete(audioUrl);
      } else {
        if (kDebugMode) {
          print('Failed to upload file. Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading file: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _isRecording ? _stop : startRecording,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isRecording ? Colors.red : Colors.black,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24),
          ),
          child: Icon(
            _isRecording ? Icons.stop : Icons.mic,
            size: 32,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _isRecording ? 'Listening...' : 'Press the button to start',
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }
}
