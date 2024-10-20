import 'package:equatable/equatable.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sahaara/chat/presentation/services/recorder.dart';

class CallChatState extends Equatable {
  final bool isGenerating;
  final String? audioUrl;
  final bool isPlaying;
  final AudioPlayer audioPlayer;
  final bool? isPaused;
  const CallChatState({
    required this.isGenerating,
    required this.audioUrl,
    required this.isPlaying,
    required this.audioPlayer,
  this.isPaused,
  });

  @override
  List<Object?> get props => [
        isGenerating,
        audioUrl,
        isPlaying,
        audioPlayer,
        isPaused,
      ];
}
