import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/chat/data/model/call_chat_state_model.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_recorder_notifier.dart';
import 'package:sahaara/chat/presentation/services/native_audio_service.dart';

class CallChatNotifier extends Notifier<CallChatStateModel> {
  StreamSubscription? autoRecordOnAudioComplete;

  @override
  CallChatStateModel build() {
    return CallChatStateModel.initial();
  }

  void initAutoRecordingOnAudioPlayed() {
    autoRecordOnAudioComplete =
        state.audioPlayer.onPlayerComplete.listen((_) async {
      _debugLog('Audio Completed');
      _debugLog('Pausing Mansi After Playing..');
      playPause();
      // _debugLog('Waiting for 5seconds');
      // _resumeRecordingAfterDelay();
      ref.read(callChatRecorderNotifier.notifier).startRecording();
    });
  }

  void _resumeRecordingAfterDelay() {
    Future.delayed(5000.ms).then((_) {
      _debugLog('Starting to record after delay');
      ref.read(callChatRecorderNotifier.notifier).startRecording();
    });
  }

  void _debugLog(String s) {
    log(s, name: 'CallChatNotifierLogs');
  }

  void setIsGenerating(bool val) {
    state = state.copyWith(isGenerating: val);
  }

  void playPause() async {
    if (state.audioUrl == null) return;

    if (state.isPlaying) {
      await state.audioPlayer.pause();
      _debugLog('Paused Mansi');
      state = state.copyWith(isPlaying: false);
    } else {
      state = state.copyWith(isPlaying: true);
      if (((await state.audioPlayer.getCurrentPosition()) ?? Duration.zero)
              .inSeconds >
          0) {
        _debugLog('Resuming existing audio url');
        await state.audioPlayer.resume();
      } else {
        _debugLog('Starting to play Mansi with UrlSource ${state.audioUrl}');
        await state.audioPlayer
            .play(UrlSource(state.audioUrl!))
            .then((_) async {
          _debugLog('Started Streaming...');
        });
      }

      // await state.audioPlayer.play(UrlSource(state.audioUrl!));
    }
  }

  void setAudioUrlAndPlay(String audioUrl) {
    state = state.copyWith(audioUrl: audioUrl);
    playPause();
  }

  void onRecordingComplete(String url) {
    state = state.copyWith(audioUrl: url);
    playPause(); // Automatically start playing
  }

  void toggleIsPlaying() {
    playPause();
  }
}

final callChatNotifier = NotifierProvider<CallChatNotifier, CallChatStateModel>(
    CallChatNotifier.new);
