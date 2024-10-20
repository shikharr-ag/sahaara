import 'dart:async';
import 'dart:developer';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/chat/domain/entity/call_record_controller_state.dart';

class CallRecordControllerNotifier extends Notifier<CallRecordControllerState> {
  StreamSubscription? _elapsedDurationSubscription;
  StreamSubscription? _elapsedDurationSubscriptionPlayer;

  void _debugLog(String s) {
    log(s, name: 'CallRecordControllerLogs');
  }

  CallRecordControllerState build() {
    return CallRecordControllerState(
      isPaused: true,
      isRecording: false,
      recorderController: RecorderController(),
      isDone: false,
      isAudio: false,
      elapsedDuration: Duration.zero,
      playerController: PlayerController(),
      elapsedDurationPlayer: Duration.zero,
    );
  }

  Future _handleSubscription({bool onlyCancel = false}) async {
    if (_elapsedDurationSubscription != null) {
      await _elapsedDurationSubscription!.cancel();
      _elapsedDurationSubscription = null;

      _debugLog('Cancelled Existing Sub..');
    }
    if (!onlyCancel) {
      _debugLog('Starting New Sub');
      _elapsedDurationSubscription ??=
          state.recorderController.onCurrentDuration.listen((_) {
        _debugLog('Updating elapsed with ${_.inSeconds}');
        state = state.copyWith(elapsedDuration: _);
      });
    }
  }

  Future _handleSubscriptionPlayer({bool onlyCancel = false}) async {
    if (_elapsedDurationSubscriptionPlayer != null) {
      await _elapsedDurationSubscriptionPlayer!.cancel();
      _elapsedDurationSubscriptionPlayer = null;

      _debugLog('Cancelled Existing Sub Player..');
    }
    if (!onlyCancel) {
      _debugLog('Starting New Sub Player');
      _elapsedDurationSubscriptionPlayer ??=
          state.playerController.onCurrentDurationChanged.listen((_) {
        _debugLog('Updating player elapsed with ${_}');
        state =
            state.copyWith(elapsedDurationPlayer: Duration(milliseconds: _));
      });
    }
  }

  void deleteAudio() async {
    state.recorderController.reset();
    await _handleSubscription(onlyCancel: true);
    state = CallRecordControllerState(
      isPaused: true,
      isRecording: false,
      recorderController: RecorderController(),
      isDone: false,
      isAudio: false,
      playerController: PlayerController(),
      elapsedDuration: Duration.zero,
      elapsedDurationPlayer: Duration.zero,
    );
  }

  void switchToAudio() {
    state = state.copyWith(isAudio: true, isRecording: true);
    state.recorderController.record();
    _debugLog('Started Recording & Switched to Audio..');
    _handleSubscription();
  }

  void setIsDone(bool val) {
    state = state.copyWith(isDone: val);
  }

  void playAudio() async {
    state = state.copyWith(isPaused: false);
    if (state.audioPath != null) {
      await state.playerController.preparePlayer(path: state.audioPath!);
      state.playerController.startPlayer(finishMode: FinishMode.loop);
      _handleSubscriptionPlayer();
    }

    _debugLog('Resumed Playing Audio');
  }

  void pauseAudio() async {
    state = state.copyWith(isPaused: true);

    await state.playerController.pausePlayer();
    _debugLog('Paused Playing Audio');
  }

  void setRecordingDone() async {
    String? _audioPath = await state.recorderController.stop();
    _debugLog('Completed Recording with path $_audioPath');
    state = state.copyWith(
      audioPath: _audioPath,
      isRecording: false,
      isDone: true,
    );
  }

  void refreshController() async {
    await _handleSubscription(onlyCancel: true);
    await _handleSubscriptionPlayer(onlyCancel: true);
    state.recorderController.dispose();
    state.playerController.dispose();
    _debugLog('Refreshed Controllers');
    RecorderController controller = RecorderController();
    PlayerController playerController = PlayerController();
    controller.record();
    state = state.copyWith(
        recorderController: controller,
        playerController: playerController,
        audioPath: null,
        isDone: false,
        isRecording: true);
    _debugLog('Started recording..');
    await _handleSubscription();
  }

  void setIsRecording(bool val) {
    state = state.copyWith(isRecording: val);
  }
}

final callRecordControllerNotifier =
    NotifierProvider<CallRecordControllerNotifier, CallRecordControllerState>(
        CallRecordControllerNotifier.new);
