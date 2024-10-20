// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_record_controller_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CallRecordControllerStateCWProxy {
  CallRecordControllerState recorderController(
      RecorderController recorderController);

  CallRecordControllerState isRecording(bool isRecording);

  CallRecordControllerState isPaused(bool isPaused);

  CallRecordControllerState isDone(bool isDone);

  CallRecordControllerState isAudio(bool isAudio);

  CallRecordControllerState audioPath(String? audioPath);

  CallRecordControllerState elapsedDurationPlayer(
      Duration elapsedDurationPlayer);

  CallRecordControllerState elapsedDuration(Duration elapsedDuration);

  CallRecordControllerState playerController(PlayerController playerController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallRecordControllerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallRecordControllerState(...).copyWith(id: 12, name: "My name")
  /// ````
  CallRecordControllerState call({
    RecorderController? recorderController,
    bool? isRecording,
    bool? isPaused,
    bool? isDone,
    bool? isAudio,
    String? audioPath,
    Duration? elapsedDurationPlayer,
    Duration? elapsedDuration,
    PlayerController? playerController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCallRecordControllerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCallRecordControllerState.copyWith.fieldName(...)`
class _$CallRecordControllerStateCWProxyImpl
    implements _$CallRecordControllerStateCWProxy {
  const _$CallRecordControllerStateCWProxyImpl(this._value);

  final CallRecordControllerState _value;

  @override
  CallRecordControllerState recorderController(
          RecorderController recorderController) =>
      this(recorderController: recorderController);

  @override
  CallRecordControllerState isRecording(bool isRecording) =>
      this(isRecording: isRecording);

  @override
  CallRecordControllerState isPaused(bool isPaused) => this(isPaused: isPaused);

  @override
  CallRecordControllerState isDone(bool isDone) => this(isDone: isDone);

  @override
  CallRecordControllerState isAudio(bool isAudio) => this(isAudio: isAudio);

  @override
  CallRecordControllerState audioPath(String? audioPath) =>
      this(audioPath: audioPath);

  @override
  CallRecordControllerState elapsedDurationPlayer(
          Duration elapsedDurationPlayer) =>
      this(elapsedDurationPlayer: elapsedDurationPlayer);

  @override
  CallRecordControllerState elapsedDuration(Duration elapsedDuration) =>
      this(elapsedDuration: elapsedDuration);

  @override
  CallRecordControllerState playerController(
          PlayerController playerController) =>
      this(playerController: playerController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallRecordControllerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallRecordControllerState(...).copyWith(id: 12, name: "My name")
  /// ````
  CallRecordControllerState call({
    Object? recorderController = const $CopyWithPlaceholder(),
    Object? isRecording = const $CopyWithPlaceholder(),
    Object? isPaused = const $CopyWithPlaceholder(),
    Object? isDone = const $CopyWithPlaceholder(),
    Object? isAudio = const $CopyWithPlaceholder(),
    Object? audioPath = const $CopyWithPlaceholder(),
    Object? elapsedDurationPlayer = const $CopyWithPlaceholder(),
    Object? elapsedDuration = const $CopyWithPlaceholder(),
    Object? playerController = const $CopyWithPlaceholder(),
  }) {
    return CallRecordControllerState(
      recorderController: recorderController == const $CopyWithPlaceholder() ||
              recorderController == null
          ? _value.recorderController
          // ignore: cast_nullable_to_non_nullable
          : recorderController as RecorderController,
      isRecording:
          isRecording == const $CopyWithPlaceholder() || isRecording == null
              ? _value.isRecording
              // ignore: cast_nullable_to_non_nullable
              : isRecording as bool,
      isPaused: isPaused == const $CopyWithPlaceholder() || isPaused == null
          ? _value.isPaused
          // ignore: cast_nullable_to_non_nullable
          : isPaused as bool,
      isDone: isDone == const $CopyWithPlaceholder() || isDone == null
          ? _value.isDone
          // ignore: cast_nullable_to_non_nullable
          : isDone as bool,
      isAudio: isAudio == const $CopyWithPlaceholder() || isAudio == null
          ? _value.isAudio
          // ignore: cast_nullable_to_non_nullable
          : isAudio as bool,
      audioPath: audioPath == const $CopyWithPlaceholder()
          ? _value.audioPath
          // ignore: cast_nullable_to_non_nullable
          : audioPath as String?,
      elapsedDurationPlayer:
          elapsedDurationPlayer == const $CopyWithPlaceholder() ||
                  elapsedDurationPlayer == null
              ? _value.elapsedDurationPlayer
              // ignore: cast_nullable_to_non_nullable
              : elapsedDurationPlayer as Duration,
      elapsedDuration: elapsedDuration == const $CopyWithPlaceholder() ||
              elapsedDuration == null
          ? _value.elapsedDuration
          // ignore: cast_nullable_to_non_nullable
          : elapsedDuration as Duration,
      playerController: playerController == const $CopyWithPlaceholder() ||
              playerController == null
          ? _value.playerController
          // ignore: cast_nullable_to_non_nullable
          : playerController as PlayerController,
    );
  }
}

extension $CallRecordControllerStateCopyWith on CallRecordControllerState {
  /// Returns a callable class that can be used as follows: `instanceOfCallRecordControllerState.copyWith(...)` or like so:`instanceOfCallRecordControllerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CallRecordControllerStateCWProxy get copyWith =>
      _$CallRecordControllerStateCWProxyImpl(this);
}
