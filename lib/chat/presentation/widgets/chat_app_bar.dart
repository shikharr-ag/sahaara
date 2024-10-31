import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/chat/presentation/notifier/chat_mode_notifier.dart';
import 'package:sahaara/chat/presentation/widgets/appbar_action.dart';
import 'package:sahaara/global/extension/date_time_extension.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/home/presentation/screens/home_screen.dart';
import 'package:transition/transition.dart';

class ChatAppBar extends ConsumerWidget {
  final bool hideActions;
  const ChatAppBar({super.key, this.hideActions = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMode = ref.watch(chatModeNotifier);
    return Row(
      children: [
        BackButton(
          onPressed: () async {
            if (Navigator.canPop(context)) {
              if (hideActions)
                Navigator.of(context).pop();
              else {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Pause this Session ?'),
                      content: const Text(
                        'Are you sure you want to pause this session? You can resume it at any time.',
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: const Text(
                            'Pause Session',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            } else {
              Navigator.of(context)
                  .pushReplacement(Transition(child: MyHomePage(title: '')));
            }
          },
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            'Session 1 (${DateTime.now().toLongDate()})',
            style: AppColors.theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (!hideActions) ...[
          if (chatMode == ChatMode.text) SwitchModeAction(),
          if (chatMode == ChatMode.call) ...[
            PlayPauseAction(),
            StopRecordingAction(),
            SwitchModeAction(),
          ],
        ],
      ],
    );
  }
}
