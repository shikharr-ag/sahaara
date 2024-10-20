import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sahaara/chat/presentation/notifier/chat_mode_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/get_sahaara_endpoint_notifier.dart';
import 'package:sahaara/chat/presentation/screens/call_chat_screen.dart';
import 'package:sahaara/chat/presentation/screens/text_chat_screen.dart';
import 'package:sahaara/global/sahaara_theme.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  // bool isFetching = true;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (ref.read(getSahaaraEndpointNotifier).isEmpty) {
    //     ref
    //         .read(getSahaaraEndpointNotifier.notifier)
    //         .getSaharaEndpoint()
    //         .then((_) {
    //       setState(() {
    //         isFetching = false;
    //       });
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final chatMode = ref.watch(chatModeNotifier);
    return Scaffold(
      // Add Scaffold to provide full screen constraints
      body: SizedBox(
        // Wrap with SizedBox to fill available space
        width: double.infinity,
        height: double.infinity,
        child: AnimatedCrossFade(
          firstChild: const CallChatScreen(),
          secondChild: const TextChatScreen(),
          duration: 1000.ms,
          crossFadeState: chatMode == ChatMode.text
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
            return Stack(
              children: [
                Positioned.fill(
                  key: bottomChildKey,
                  child: bottomChild,
                ),
                Positioned.fill(
                  key: topChildKey,
                  child: topChild,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
