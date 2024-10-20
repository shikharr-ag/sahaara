import 'dart:async';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:record/record.dart';
import 'package:sahaara/chat/domain/entity/call_chat_recorder_state.dart';

part 'call_chat_recorder_model.g.dart';

@CopyWith()
class CallChatRecorderStateModel extends CallChatRecorderState {
  CallChatRecorderStateModel({
    required bool isBackgroundServiceRunning,
    required bool isRecording,
    required AudioRecorder audioRecorder,
    Timer? amplitudeTimer,
    String? recordingPath,
    required double backgroundNoiseLevel,
    required int silenceCounter,
    required double peakAmplitude,
    required bool speechDetected,
    required int speechCounter,

  }) : super(
    isBackgroundServiceRunning: isBackgroundServiceRunning,
          isRecording: isRecording,
          audioRecorder: audioRecorder,
          amplitudeTimer: amplitudeTimer,
          recordingPath: recordingPath,
          backgroundNoiseLevel: backgroundNoiseLevel,
          silenceCounter: silenceCounter,
          peakAmplitude: peakAmplitude,
          speechDetected: speechDetected,
          speechCounter: speechCounter,
        );

  // Factory constructor for default initial values
  factory CallChatRecorderStateModel.initial() {
    return CallChatRecorderStateModel(
      isBackgroundServiceRunning: false,
      isRecording: false,
      audioRecorder: AudioRecorder(),
      amplitudeTimer: null,
      recordingPath: null,
      backgroundNoiseLevel: -60.0,
      silenceCounter: 0,
      peakAmplitude: -60.0,
      speechDetected: false,
      speechCounter: 0,
    );
  }

  // Method to create an object from a JSON map (deserialization)
  factory CallChatRecorderStateModel.fromJson(Map<String, dynamic> json) {
    return CallChatRecorderStateModel(
      isBackgroundServiceRunning: false,//
      isRecording: json['isRecording'] ?? false,
      audioRecorder: AudioRecorder(), // AudioRecorder is non-serializable
      amplitudeTimer: null, // Timer is non-serializable
      recordingPath: json['recordingPath'],
      backgroundNoiseLevel: (json['backgroundNoiseLevel'] ?? -60.0).toDouble(),
      silenceCounter: json['silenceCounter'] ?? 0,
      peakAmplitude: (json['peakAmplitude'] ?? -60.0).toDouble(),
      speechDetected: json['speechDetected'] ?? false,
      speechCounter: json['speechCounter'] ?? 0,
    );
  }

  // Method to convert the object to a JSON map (serialization)
  Map<String, dynamic> toJson() {
    return {
      'isRecording': isRecording,
      'recordingPath': recordingPath,
      'backgroundNoiseLevel': backgroundNoiseLevel,
      'silenceCounter': silenceCounter,
      'peakAmplitude': peakAmplitude,
      'speechDetected': speechDetected,
      'speechCounter': speechCounter,
      // audioRecorder and amplitudeTimer are not serializable
    };
  }
}
