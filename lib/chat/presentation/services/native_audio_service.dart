import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/chat/data/model/call_chat_recorder_model.dart';
import 'package:sahaara/chat/domain/entity/call_chat_state.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_recorder_notifier.dart';

import '../../data/model/call_chat_state_model.dart';

class NativeAudioService {
  NativeAudioService._();

  static void _debugLog(String s) {
    log(s, name: 'NativeAudioServiceLogs');
  }

  static const platform = MethodChannel('com.example.sahaara/audio_service');

  static Future<void> startBackgroundService(WidgetRef ref) async {
    CallChatRecorderStateModel callChatRecorderStateModel = ref.watch(callChatRecorderNotifier);
    if (callChatRecorderStateModel.isRecording) {
      try {
        await platform.invokeMethod('startAudioService');
        ref.read(callChatRecorderNotifier.notifier).setIsBackgroundServiceRunning(true);
      } on PlatformException catch (e) {
        _debugLog("Failed to start background service: '${e.message}'.");
      }
    }
  }

  static Future<void> stopBackgroundService(WidgetRef ref) async {
    try {
      await platform.invokeMethod('stopAudioService');
      ref.read(callChatRecorderNotifier.notifier).setIsBackgroundServiceRunning(false);
    } on PlatformException catch (e) {
      _debugLog("Failed to stop background service: '${e.message}'.");
    }
  }
}
