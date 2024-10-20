import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_recorder_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/call_record_controller_notifier.dart';
import 'package:sahaara/chat/presentation/screens/call_chat_screen.dart';
import 'package:sahaara/global/sahaara_theme.dart';

class MessageBarActions extends ConsumerWidget {
  const MessageBarActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callRecordControllerState = ref.watch(callRecordControllerNotifier);
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () {
                if (callRecordControllerState.isAudio) {
                  ref
                      .read(callRecordControllerNotifier.notifier)
                      .refreshController();
                } else {
                  //send Message
                }
              },
              icon: Icon(
              callRecordControllerState.isAudio ?  Icons.refresh : Icons.send_rounded,
                color: AppColors.background,
                
              ),
              iconSize: 28,
            ),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () {
                if (callRecordControllerState.isRecording) {
                  ref
                      .read(callRecordControllerNotifier.notifier)
                      .setRecordingDone();
                } else {
                  if (callRecordControllerState.isAudio) {
                      ref
                      .read(callRecordControllerNotifier.notifier)
                      .deleteAudio();
                  } else {
                    ref
                        .read(callRecordControllerNotifier.notifier)
                        .switchToAudio();
                  }
                }
              },
              icon: Icon(callRecordControllerState.isRecording
                  ? Icons.stop
                  : callRecordControllerState.isAudio
                      ? Icons.send_rounded
                      : Icons.mic),
              color: AppColors.background,
              iconSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
