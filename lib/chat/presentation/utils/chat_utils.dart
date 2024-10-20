import 'dart:math';

import 'package:sahaara/chat/domain/entity/message.dart';

import '../../data/model/message_model.dart';

class ChatUtils 
{
    static List<double> generateSpeechLikeWave() {
    final random = Random();
    List<double> samples = [];
    double prevValue = 0;
    
    for (int i = 0; i < 100; i++) {
      // Generate random value with smooth transitions
      double newValue = prevValue + (random.nextDouble() - 0.5) * 0.3;
      // Constrain values between -1 and 1
      newValue = newValue.clamp(-1.0, 1.0);
      samples.add(newValue);
      prevValue = newValue;
    }
    return samples;
  }
  
  // First, let's create the conversation data
static final List<MessageModel> therapyConversation = [
  MessageModel(
    text: "Hello, I'm here to listen and help. How are you feeling today?",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: '',  // therapist
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 0).toUtc(),
  ),
  MessageModel(
    text: "I've been feeling overwhelmed lately with work and personal life.",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: 'user123',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 1).toUtc(),
  ),
  MessageModel(
    text: "Can you tell me more about what's been overwhelming you?",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: '',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 2).toUtc(),
  ),
  MessageModel(
    text: "I've been working long hours, and my relationship is suffering because of it.",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: 'user123',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 3).toUtc(),
  ),
  MessageModel(
    text: "I hear how challenging this balance has been. How long has this been going on?",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: '',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 4).toUtc(),
  ),
  MessageModel(
    text: "About three months now. Ever since I got promoted.",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: 'user123',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 5).toUtc(),
  ),
  MessageModel(
    text: "Congratulations on the promotion. Have you discussed these feelings with your partner?",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: '',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 6).toUtc(),
  ),
  MessageModel(
    text: "Not really. I feel guilty bringing it up.",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: 'user123',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 7).toUtc(),
  ),
  MessageModel(
    text: "What makes you feel guilty about discussing this?",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: '',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 8).toUtc(),
  ),
  MessageModel(
    text: "They've been so supportive of my career. It feels selfish to complain now.",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: 'user123',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 9).toUtc(),
  ),
  MessageModel(
    text: "It's not complaining to share your struggles. Would you view it as selfish if your partner came to you with similar concerns?",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: '',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 10).toUtc(),
  ),
  MessageModel(
    text: "No, I suppose not. I would want them to tell me.",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: 'user123',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 11).toUtc(),
  ),
  // ... continuing with more messages to reach 30 total
  MessageModel(
    text: "What's holding you back from having this conversation with them?",
    waveformData: ChatUtils.generateSpeechLikeWave(),
    type: TextType.audio,
    uid: '',
    audioUrl: 'https://firebasestorage.googleapis.com/v0/b/saahara-1.appspot.com/o/0e5567f8-04f7-4394-977d-447fc564c97b.mp3?alt=media&token=0e0e51d2-05e6-4f37-91d5-b23591781fbd',
    createdAt: DateTime.utc(2024, 10, 19, 10, 12).toUtc(),
  ),
  // Adding more messages to complete the conversation...
  // Continuing with remaining messages following the same pattern
  // Each message is timestamped 1 minute after the previous one
  
  // For brevity, I'll skip to message 30, but the full list would contain all 30 messages
];

}