import '../../domain/entity/message.dart';

class MessageModel extends Message {
const  MessageModel({
    required super.text,
    required super.waveformData,
    required super.type,
    required super.uid,
    required super.audioUrl,
    required super.createdAt,
  });

  // Factory constructor for default initial values
  factory MessageModel.initial() {
    return MessageModel(
      text: '',
      waveformData: [],
      type: TextType.text,
      uid: '',
      audioUrl: '',
      createdAt: DateTime.now(),
    );
  }

  // Method to create an object from a JSON map (deserialization)
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'] ?? '',
      waveformData: List<double>.from(json['waveformData'] ?? []),
      type: TextType.values[json['type'] ?? 0], // Assuming enum is saved as index
      uid: json['uid'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  // Method to convert the object to a JSON map (serialization)
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'waveformData': waveformData,
      'type': type.index, // Save enum as index
      'uid': uid,
      'audioUrl': audioUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
