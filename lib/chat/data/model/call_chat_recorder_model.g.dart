// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_chat_recorder_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CallChatRecorderStateModelCWProxy {
  CallChatRecorderStateModel isBackgroundServiceRunning(
      bool isBackgroundServiceRunning);

  CallChatRecorderStateModel isRecording(bool isRecording);

  CallChatRecorderStateModel audioRecorder(AudioRecorder audioRecorder);

  CallChatRecorderStateModel amplitudeTimer(Timer? amplitudeTimer);

  CallChatRecorderStateModel recordingPath(String? recordingPath);

  CallChatRecorderStateModel backgroundNoiseLevel(double backgroundNoiseLevel);

  CallChatRecorderStateModel silenceCounter(int silenceCounter);

  CallChatRecorderStateModel peakAmplitude(double peakAmplitude);

  CallChatRecorderStateModel speechDetected(bool speechDetected);

  CallChatRecorderStateModel speechCounter(int speechCounter);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallChatRecorderStateModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallChatRecorderStateModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CallChatRecorderStateModel call({
    bool? isBackgroundServiceRunning,
    bool? isRecording,
    AudioRecorder? audioRecorder,
    Timer? amplitudeTimer,
    String? recordingPath,
    double? backgroundNoiseLevel,
    int? silenceCounter,
    double? peakAmplitude,
    bool? speechDetected,
    int? speechCounter,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCallChatRecorderStateModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCallChatRecorderStateModel.copyWith.fieldName(...)`
class _$CallChatRecorderStateModelCWProxyImpl
    implements _$CallChatRecorderStateModelCWProxy {
  const _$CallChatRecorderStateModelCWProxyImpl(this._value);

  final CallChatRecorderStateModel _value;

  @override
  CallChatRecorderStateModel isBackgroundServiceRunning(
          bool isBackgroundServiceRunning) =>
      this(isBackgroundServiceRunning: isBackgroundServiceRunning);

  @override
  CallChatRecorderStateModel isRecording(bool isRecording) =>
      this(isRecording: isRecording);

  @override
  CallChatRecorderStateModel audioRecorder(AudioRecorder audioRecorder) =>
      this(audioRecorder: audioRecorder);

  @override
  CallChatRecorderStateModel amplitudeTimer(Timer? amplitudeTimer) =>
      this(amplitudeTimer: amplitudeTimer);

  @override
  CallChatRecorderStateModel recordingPath(String? recordingPath) =>
      this(recordingPath: recordingPath);

  @override
  CallChatRecorderStateModel backgroundNoiseLevel(
          double backgroundNoiseLevel) =>
      this(backgroundNoiseLevel: backgroundNoiseLevel);

  @override
  CallChatRecorderStateModel silenceCounter(int silenceCounter) =>
      this(silenceCounter: silenceCounter);

  @override
  CallChatRecorderStateModel peakAmplitude(double peakAmplitude) =>
      this(peakAmplitude: peakAmplitude);

  @override
  CallChatRecorderStateModel speechDetected(bool speechDetected) =>
      this(speechDetected: speechDetected);

  @override
  CallChatRecorderStateModel speechCounter(int speechCounter) =>
      this(speechCounter: speechCounter);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallChatRecorderStateModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallChatRecorderStateModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CallChatRecorderStateModel call({
    Object? isBackgroundServiceRunning = const $CopyWithPlaceholder(),
    Object? isRecording = const $CopyWithPlaceholder(),
    Object? audioRecorder = const $CopyWithPlaceholder(),
    Object? amplitudeTimer = const $CopyWithPlaceholder(),
    Object? recordingPath = const $CopyWithPlaceholder(),
    Object? backgroundNoiseLevel = const $CopyWithPlaceholder(),
    Object? silenceCounter = const $CopyWithPlaceholder(),
    Object? peakAmplitude = const $CopyWithPlaceholder(),
    Object? speechDetected = const $CopyWithPlaceholder(),
    Object? speechCounter = const $CopyWithPlaceholder(),
  }) {
    return CallChatRecorderStateModel(
      isBackgroundServiceRunning:
          isBackgroundServiceRunning == const $CopyWithPlaceholder() ||
                  isBackgroundServiceRunning == null
              ? _value.isBackgroundServiceRunning
              // ignore: cast_nullable_to_non_nullable
              : isBackgroundServiceRunning as bool,
      isRecording:
          isRecording == const $CopyWithPlaceholder() || isRecording == null
              ? _value.isRecording
              // ignore: cast_nullable_to_non_nullable
              : isRecording as bool,
      audioRecorder:
          audioRecorder == const $CopyWithPlaceholder() || audioRecorder == null
              ? _value.audioRecorder
              // ignore: cast_nullable_to_non_nullable
              : audioRecorder as AudioRecorder,
      amplitudeTimer: amplitudeTimer == const $CopyWithPlaceholder()
          ? _value.amplitudeTimer
          // ignore: cast_nullable_to_non_nullable
          : amplitudeTimer as Timer?,
      recordingPath: recordingPath == const $CopyWithPlaceholder()
          ? _value.recordingPath
          // ignore: cast_nullable_to_non_nullable
          : recordingPath as String?,
      backgroundNoiseLevel:
          backgroundNoiseLevel == const $CopyWithPlaceholder() ||
                  backgroundNoiseLevel == null
              ? _value.backgroundNoiseLevel
              // ignore: cast_nullable_to_non_nullable
              : backgroundNoiseLevel as double,
      silenceCounter: silenceCounter == const $CopyWithPlaceholder() ||
              silenceCounter == null
          ? _value.silenceCounter
          // ignore: cast_nullable_to_non_nullable
          : silenceCounter as int,
      peakAmplitude:
          peakAmplitude == const $CopyWithPlaceholder() || peakAmplitude == null
              ? _value.peakAmplitude
              // ignore: cast_nullable_to_non_nullable
              : peakAmplitude as double,
      speechDetected: speechDetected == const $CopyWithPlaceholder() ||
              speechDetected == null
          ? _value.speechDetected
          // ignore: cast_nullable_to_non_nullable
          : speechDetected as bool,
      speechCounter:
          speechCounter == const $CopyWithPlaceholder() || speechCounter == null
              ? _value.speechCounter
              // ignore: cast_nullable_to_non_nullable
              : speechCounter as int,
    );
  }
}

extension $CallChatRecorderStateModelCopyWith on CallChatRecorderStateModel {
  /// Returns a callable class that can be used as follows: `instanceOfCallChatRecorderStateModel.copyWith(...)` or like so:`instanceOfCallChatRecorderStateModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CallChatRecorderStateModelCWProxy get copyWith =>
      _$CallChatRecorderStateModelCWProxyImpl(this);
}
