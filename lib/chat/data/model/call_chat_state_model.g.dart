// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_chat_state_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CallChatStateModelCWProxy {
  CallChatStateModel isGenerating(bool isGenerating);

  CallChatStateModel audioUrl(String? audioUrl);

  CallChatStateModel isPlaying(bool isPlaying);

  CallChatStateModel audioPlayer(AudioPlayer audioPlayer);

  CallChatStateModel isPaused(bool? isPaused);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallChatStateModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallChatStateModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CallChatStateModel call({
    bool? isGenerating,
    String? audioUrl,
    bool? isPlaying,
    AudioPlayer? audioPlayer,
    bool? isPaused,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCallChatStateModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCallChatStateModel.copyWith.fieldName(...)`
class _$CallChatStateModelCWProxyImpl implements _$CallChatStateModelCWProxy {
  const _$CallChatStateModelCWProxyImpl(this._value);

  final CallChatStateModel _value;

  @override
  CallChatStateModel isGenerating(bool isGenerating) =>
      this(isGenerating: isGenerating);

  @override
  CallChatStateModel audioUrl(String? audioUrl) => this(audioUrl: audioUrl);

  @override
  CallChatStateModel isPlaying(bool isPlaying) => this(isPlaying: isPlaying);

  @override
  CallChatStateModel audioPlayer(AudioPlayer audioPlayer) =>
      this(audioPlayer: audioPlayer);

  @override
  CallChatStateModel isPaused(bool? isPaused) => this(isPaused: isPaused);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CallChatStateModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CallChatStateModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CallChatStateModel call({
    Object? isGenerating = const $CopyWithPlaceholder(),
    Object? audioUrl = const $CopyWithPlaceholder(),
    Object? isPlaying = const $CopyWithPlaceholder(),
    Object? audioPlayer = const $CopyWithPlaceholder(),
    Object? isPaused = const $CopyWithPlaceholder(),
  }) {
    return CallChatStateModel(
      isGenerating:
          isGenerating == const $CopyWithPlaceholder() || isGenerating == null
              ? _value.isGenerating
              // ignore: cast_nullable_to_non_nullable
              : isGenerating as bool,
      audioUrl: audioUrl == const $CopyWithPlaceholder()
          ? _value.audioUrl
          // ignore: cast_nullable_to_non_nullable
          : audioUrl as String?,
      isPlaying: isPlaying == const $CopyWithPlaceholder() || isPlaying == null
          ? _value.isPlaying
          // ignore: cast_nullable_to_non_nullable
          : isPlaying as bool,
      audioPlayer:
          audioPlayer == const $CopyWithPlaceholder() || audioPlayer == null
              ? _value.audioPlayer
              // ignore: cast_nullable_to_non_nullable
              : audioPlayer as AudioPlayer,
      isPaused: isPaused == const $CopyWithPlaceholder()
          ? _value.isPaused
          // ignore: cast_nullable_to_non_nullable
          : isPaused as bool?,
    );
  }
}

extension $CallChatStateModelCopyWith on CallChatStateModel {
  /// Returns a callable class that can be used as follows: `instanceOfCallChatStateModel.copyWith(...)` or like so:`instanceOfCallChatStateModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CallChatStateModelCWProxy get copyWith =>
      _$CallChatStateModelCWProxyImpl(this);
}
