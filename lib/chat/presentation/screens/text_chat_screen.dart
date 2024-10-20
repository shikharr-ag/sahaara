import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaara/chat/data/model/message_model.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_recorder_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/call_record_controller_notifier.dart';
import 'package:sahaara/chat/presentation/utils/chat_utils.dart';
import 'package:sahaara/chat/presentation/widgets/appbar_action.dart';
import 'package:sahaara/chat/presentation/widgets/chat_app_bar.dart';
import 'package:sahaara/chat/presentation/widgets/chat_bubble.dart';
import 'package:sahaara/chat/presentation/widgets/message_bar_actions.dart';
import 'package:sahaara/global/extension/date_time_extension.dart';
import 'package:sahaara/global/extension/duration_extension.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/global/sizing.dart';
import 'package:sahaara/global/widgets/blurry_blobs.dart';
import 'package:sizer/sizer.dart';

import 'call_chat_screen.dart';

class TextChatScreen extends ConsumerStatefulWidget {
  final bool isViewOnly;
  const TextChatScreen({
    super.key,
    this.isViewOnly = false,
  });

  @override
  ConsumerState<TextChatScreen> createState() => _TextChatScreenState();
}

class _TextChatScreenState extends ConsumerState<TextChatScreen> {
  @override
  Widget build(BuildContext context) {
    final callRecordControllerState = ref.watch(callRecordControllerNotifier);

    return Stack(
      children: [
        const BlurryBlobs(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ChatAppBar(hideActions: widget.isViewOnly),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        ChatUtils.therapyConversation.length,
                        (i) => ChatBubble(
                          messageModel: ChatUtils.therapyConversation[i],
                        ),
                      ),
                    ),
                  ),
                ),
                if (!widget.isViewOnly)
                  Container(
                    color: AppColors.secondaryDark,
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: callRecordControllerState.isRecording ||
                                    callRecordControllerState.isAudio
                                ? Row(
                                    children: [
                                      if (callRecordControllerState.isDone) ...[
                                        SizedBox(
                                          width: 50,
                                          child: IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      callRecordControllerNotifier
                                                          .notifier)
                                                  .deleteAudio();
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: AppColors.background,
                                            ),
                                            iconSize: 28,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: IconButton(
                                            icon: Icon(
                                              callRecordControllerState.isPaused
                                                  ? Icons.play_arrow
                                                  : Icons.pause,
                                              color: AppColors.background,
                                            ),
                                            onPressed: () {
                                              if (callRecordControllerState
                                                  .isPaused) {
                                                ref
                                                    .read(
                                                        callRecordControllerNotifier
                                                            .notifier)
                                                    .playAudio();
                                              } else {
                                                ref
                                                    .read(
                                                        callRecordControllerNotifier
                                                            .notifier)
                                                    .pauseAudio();
                                              }
                                            },
                                            iconSize: 28,
                                          ),
                                        ),
                                      ],
                                      if (callRecordControllerState.isRecording)
                                        const SizedBox(
                                          width: 100,
                                        ),
                                      Stack(
                                        children: [
                                          callRecordControllerState.isDone
                                              ? AudioFileWaveforms(
                                                  size: Size(100.w - 200, 65),
                                                  playerController:
                                                      callRecordControllerState
                                                          .playerController,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    color: AppColors.secondary,
                                                  ),
                                                  playerWaveStyle:
                                                      PlayerWaveStyle(
                                                    fixedWaveColor:
                                                        AppColors.primaryDark,
                                                  ),
                                                  // Allow user to seek within the audio file
                                                )
                                              : AudioWaveforms(
                                                  enableGesture: true,
                                                  size: Size(100.w - 200, 65),
                                                  recorderController:
                                                      callRecordControllerState
                                                          .recorderController,
                                                  waveStyle: const WaveStyle(
                                                    waveColor:
                                                        AppColors.primaryDark,
                                                    extendWaveform: true,
                                                    showMiddleLine: false,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    color: AppColors.secondary,
                                                  ),
                                                  // padding:
                                                  //     const EdgeInsets.only(left: 6),
                                                  // margin: const EdgeInsets.symmetric(
                                                  //     horizontal: 5),
                                                ),
                                          Positioned(
                                            right: 20,
                                            bottom: 0,
                                            child: Text(
                                              callRecordControllerState
                                                      .isRecording
                                                  ? callRecordControllerState
                                                      .recorderController
                                                      .elapsedDuration
                                                      .toMinutesSeconds()
                                                  : callRecordControllerState
                                                      .elapsedDurationPlayer
                                                      .toMinutesSeconds(),
                                              style: AppColors
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.background,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Container(
                                    height: 50,
                                    padding: const EdgeInsets.only(left: 18),
                                    margin: const EdgeInsets.only(right: 15),
                                    child: TextField(
                                      style: GoogleFonts.urbanist(
                                        color: AppColors.background,
                                      ),
                                      cursorColor: AppColors.background,
                                      decoration: const InputDecoration(
                                        hintText: "Type Something...",
                                        hintStyle:
                                            TextStyle(color: Colors.white54),
                                        contentPadding:
                                            EdgeInsets.only(top: 16, left: 12),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.secondary,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        MessageBarActions(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
