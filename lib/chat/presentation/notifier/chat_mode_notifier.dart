import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ChatMode {
  text,
  call;
}

class ChatModeNotifier extends Notifier<ChatMode> {
  @override
  ChatMode build() {
    return ChatMode.call;
  }

  void switchToText() {
    state = ChatMode.text;
  }

  void switchToCall() {
    state = ChatMode.call;
  }
}

final chatModeNotifier =
    NotifierProvider<ChatModeNotifier, ChatMode>(ChatModeNotifier.new);
