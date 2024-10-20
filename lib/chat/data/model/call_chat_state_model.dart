import 'package:audioplayers/audioplayers.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:sahaara/chat/domain/entity/call_chat_state.dart';
import 'package:sahaara/chat/presentation/services/recorder.dart';

part 'call_chat_state_model.g.dart';

@CopyWith()
class CallChatStateModel extends CallChatState {
  CallChatStateModel({
    required bool isGenerating,
    required String? audioUrl,
    required bool isPlaying,
    required AudioPlayer audioPlayer,
    bool? isPaused,
  }) : super(
          isGenerating: isGenerating,
          audioUrl: audioUrl,
          isPlaying: isPlaying,
          audioPlayer: audioPlayer,
        isPaused: isPaused,
        );

  // Factory constructor for default initial values
  factory CallChatStateModel.initial() {
    return CallChatStateModel(
      isGenerating: false,
      audioUrl: null,
      isPlaying: false,
      audioPlayer: AudioPlayer(),
      isPaused: null,
    );
  }

  // Method to create an object from a JSON map (deserialization)
  factory CallChatStateModel.fromJson(Map<String, dynamic> json) {
    return CallChatStateModel(
      isGenerating: false,
      audioUrl: json['audioUrl'],
      isPlaying: json['isPlaying'] ?? false,
      audioPlayer: AudioPlayer(), // AudioPlayer is also non-serializable
      isPaused: json['isPaused']??false,
    );
  }

  // Method to convert the object to a JSON map (serialization)
  Map<String, dynamic> toJson() {
    return {
      'audioUrl': audioUrl,
      'isPlaying': isPlaying,
      // recorderKey and audioPlayer cannot be serialized
    };
  }
}
