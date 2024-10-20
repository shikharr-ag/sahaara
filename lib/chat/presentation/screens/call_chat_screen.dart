import 'dart:developer';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_recorder_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/chat_mode_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/get_sahaara_endpoint_notifier.dart';
import 'package:sahaara/chat/presentation/screens/chat_screen.dart';
import 'package:sahaara/chat/presentation/services/native_audio_service.dart';
import 'package:sahaara/chat/presentation/services/recorder.dart';
import 'package:sahaara/chat/presentation/widgets/chat_app_bar.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/main.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:sizer/sizer.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../global/sizing.dart';
import '../widgets/appbar_action.dart';
import '../widgets/audibility_indicator.dart';

final RecorderController recorderController = RecorderController();
final PlayerController playerController = PlayerController();

class CallChatScreen extends ConsumerStatefulWidget {
  const CallChatScreen({super.key});

  @override
  ConsumerState<CallChatScreen> createState() => _CallChatScreenState();
}

class _CallChatScreenState extends ConsumerState<CallChatScreen>
    with WidgetsBindingObserver {
  late final AudioPlayer _audioPlayer;
  bool generatingWaveform = true;

  @override
  void initState() {
    super.initState();
    _audioPlayer = ref.read(callChatNotifier).audioPlayer;

    ref.read(callChatNotifier.notifier).initAutoRecordingOnAudioPlayed();
    WidgetsBinding.instance.addObserver(this);
    _audioPlayer.onPlayerComplete.listen((event) {
      ref.read(callChatNotifier.notifier).toggleIsPlaying();
      // ref
      //     .read(callChatRecorderNotifier.notifier)
      //     .startRecording(); // Start recording automatically after playback is complete
      log('Starting to record after playback complete...', name: 'CallLogs');
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused &&
        ref.read(callChatRecorderNotifier).isRecording) {
      NativeAudioService.startBackgroundService(ref);
    } else if (state == AppLifecycleState.resumed) {
      NativeAudioService.stopBackgroundService(ref);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    // if (ref.read(callChatRecorderNotifier).isBackgroundServiceRunning) {
    //   NativeAudioService.stopBackgroundService(ref);
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final callChatStateModel = ref.watch(callChatNotifier);
    final callChatRecorderModel = ref.watch(callChatRecorderNotifier);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ChatAppBar(),
            Expanded(
              child: Column(
                children: [
                  Spacer(),
                  if (callChatStateModel.isGenerating) ...[
                    Text(
                      'I am thinking :)',
                      style: AppColors.theme.textTheme.bodyLarge!,
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (callChatStateModel.isPlaying)
                    // AudioFileWaveforms(
                    //   size: Size(Sizing().wp(80), Sizing().hp(20)),
                    //   playerController: playerController,
                    //   decoration: BoxDecoration(
                    //     color: AppColors.primaryLight,
                    //   ),
                    // ),

                    Lottie.asset(
                      'assets/waveform.json',
                      height: 20.h,
                    ),
                  if (!callChatStateModel.isPlaying &&
                      !callChatStateModel.isGenerating)
                    RippleAnimation(
                      repeat: true,

                      minRadius: 60,
                      // duration: 2000.ms,
                      color: AppColors.accentLight,
                      child: GestureDetector(
                        onTap: () {
                          if (callChatRecorderModel.isRecording) {
                            ref
                                .read(callChatRecorderNotifier.notifier)
                                .stopRecording();
                          } else {
                            ref
                                .read(callChatRecorderNotifier.notifier)
                                .startRecording();
                          }
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColors.accentLight,
                          radius: 50,
                          child: Icon(
                            Icons.mic,
                            size: 40,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  // if(callChatRevt)
                  if (!callChatStateModel.isGenerating &&
                      !callChatStateModel.isPlaying) ...[
                    if (callChatRecorderModel.isRecording)
                      AudibilityIndicator(
                        amplitudeStream: callChatRecorderModel.audioRecorder
                            .onAmplitudeChanged(200.ms),
                        backgroundNoiseLevel:
                            callChatRecorderModel.backgroundNoiseLevel,
                        peakAmplitude: callChatRecorderModel.peakAmplitude,
                        silenceMargin: 5.0,
                        speechDetected: callChatRecorderModel.speechDetected,
                      ),
                    Text(
                      !callChatRecorderModel.isRecording
                          ? 'Tap and say Hi'
                          : 'I am listening to you :)',
                      style: AppColors.theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],

                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [
                      AppColors.primaryLight,
                      AppColors.primaryLight.withOpacity(0.4),
                    ],
                    [
                      AppColors.secondary,
                      AppColors.secondary.withOpacity(0.5),
                    ],
                    [
                      AppColors.accent,
                      AppColors.accent.withOpacity(0.6),
                    ],
                  ],
                  durations: [
                    16000, // Slower primary wave for a more calming effect
                    24000, // Medium speed for the middle wave
                    28000, // Slightly faster than primary but still gentle
                  ],
                  heightPercentages: [
                    0.15, // Main wave
                    0.24, // Middle wave
                    0.4, // Background wave
                  ],
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                backgroundColor: AppColors.background,
                backgroundImage: null,
                size: Size(double.infinity, double.infinity),
                waveAmplitude: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
