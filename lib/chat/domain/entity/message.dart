import 'package:equatable/equatable.dart';

enum TextType {
  text,
  audio,
  call;
}

class Message extends Equatable {
  final String text;
  final List<double> waveformData;
  final TextType type;
  final String uid;
  final String audioUrl;
  final DateTime createdAt;

  const Message({
    required this.text,
    required this.waveformData,
    required this.type,
    required this.uid,
    required this.audioUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [text, waveformData, type, uid, audioUrl, createdAt];
}
