import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/chat/data/datasource/end_session_ds.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_recorder_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/chat_mode_notifier.dart';
import 'package:sahaara/global/sahaara_theme.dart';

// Base Template Class
abstract class AppBarAction extends ConsumerWidget {
  final Color? iconColor;
  final double? iconSize;
  final String? tooltip;

  const AppBarAction({
    Key? key,
    this.iconColor,
    this.iconSize,
    this.tooltip,
  }) : super(key: key);

  // Template method to be implemented by subclasses
  IconData getIcon(WidgetRef ref);

  // Template method to be implemented by subclasses
  void onPressed(WidgetRef ref, BuildContext context);

  // Template method that can be overridden to determine if button should be enabled
  bool isEnabled(WidgetRef ref) => true;

  // Template method that can be overridden to determine icon color
  Color getIconColor(WidgetRef ref) {
    return iconColor ?? AppColors.primaryDark;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: isEnabled(ref) ? () => onPressed(ref, context) : null,
      icon: Icon(
        getIcon(ref),
        color: getIconColor(ref),
        size: iconSize,
      ),
      tooltip: tooltip,
    );
  }
}

// Play/Pause Button Implementation
class PlayPauseAction extends AppBarAction {
  const PlayPauseAction({
    Key? key,
    Color? iconColor,
    double? iconSize,
    String? tooltip,
  }) : super(
          key: key,
          iconColor: iconColor,
          iconSize: iconSize,
          tooltip: tooltip,
        );

  @override
  IconData getIcon(WidgetRef ref) {
    final isPlaying = ref.watch(callChatNotifier).isPlaying;
    return isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded;
  }

  @override
  void onPressed(WidgetRef ref, BuildContext context) {
    ref.read(callChatNotifier.notifier).toggleIsPlaying();
  }

  @override
  bool isEnabled(WidgetRef ref) {
    return !(ref.watch(callChatRecorderNotifier).isRecording &&
        ref.watch(callChatNotifier).audioUrl != null);
  }

  @override
  Color getIconColor(WidgetRef ref) {
    // final isRecording = ref.watch(callChatRecorderNotifier).isRecording;
    return isEnabled(ref) ? Colors.grey : (iconColor ?? AppColors.primaryDark);
  }
}

// Stop Recording Button Implementation
class StopRecordingAction extends AppBarAction {
  const StopRecordingAction({
    Key? key,
    Color? iconColor,
    double? iconSize,
    String? tooltip,
  }) : super(
          key: key,
          iconColor: iconColor,
          iconSize: iconSize,
          tooltip: tooltip,
        );

  @override
  IconData getIcon(WidgetRef ref) {
    return Icons.stop_circle_rounded;
  }

  @override
  void onPressed(WidgetRef ref, BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('End this Session ?'),
          content: const Text(
            'Are you sure you want to end this session? I will summarise our conversation and generate a journal for you to analyse after this session.',
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text(
                'End Session',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                // TODO: Implement delete functionality
                endSession(ref);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    ref.invalidate(callChatRecorderNotifier);
    ref.invalidate(callChatNotifier);
  }
}

// Switch Mode Button Implementation
class SwitchModeAction extends AppBarAction {
  const SwitchModeAction({
    Key? key,
    Color? iconColor,
    double? iconSize,
    String? tooltip,
  }) : super(
          key: key,
          iconColor: iconColor,
          iconSize: iconSize,
          tooltip: tooltip,
        );

  @override
  IconData getIcon(WidgetRef ref) {
    return Icons.swap_horiz_rounded;
  }

  @override
  void onPressed(WidgetRef ref, BuildContext context) {
    if (ref.read(chatModeNotifier) == ChatMode.call) {
      ref.read(chatModeNotifier.notifier).switchToText();
    } else {
      ref.read(chatModeNotifier.notifier).switchToCall();
    }
  }
}

// Optional: Convenience widget to group all actions together
class ChatAppBarActions extends ConsumerWidget {
  final Color? iconColor;
  final double? iconSize;

  const ChatAppBarActions({
    Key? key,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayPauseAction(
          iconColor: iconColor,
          iconSize: iconSize,
          tooltip: 'Play/Pause',
        ),
        StopRecordingAction(
          iconColor: iconColor,
          iconSize: iconSize,
          tooltip: 'Stop Recording',
        ),
        SwitchModeAction(
          iconColor: iconColor,
          iconSize: iconSize,
          tooltip: 'Switch Mode',
        ),
      ],
    );
  }
}
