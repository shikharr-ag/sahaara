import 'package:equatable/equatable.dart';
import 'package:record/record.dart';
import 'dart:async';

class CallChatRecorderState extends Equatable {
  final bool isRecording;
  final AudioRecorder audioRecorder;
  final Timer? amplitudeTimer;
  final String? recordingPath;
  final double backgroundNoiseLevel;
  final int silenceCounter;
  final double peakAmplitude;
  final bool speechDetected;
  final int speechCounter;
  final bool isBackgroundServiceRunning;

  const CallChatRecorderState({
    required this.isBackgroundServiceRunning,
    required this.isRecording,
    required this.audioRecorder,
    this.amplitudeTimer,
    this.recordingPath,
    required this.backgroundNoiseLevel,
    required this.silenceCounter,
    required this.peakAmplitude,
    required this.speechDetected,
    required this.speechCounter,
  });

  @override
  List<Object?> get props => [
        isRecording,
        audioRecorder,
        amplitudeTimer,
        recordingPath,
        backgroundNoiseLevel,
        silenceCounter,
        peakAmplitude,
        speechDetected,
        speechCounter,
      ];
}
