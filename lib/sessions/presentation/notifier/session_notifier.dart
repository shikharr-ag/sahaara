import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void setSessionId(String id) {
    state =id;
  }
}

final sessionNotifier =
    NotifierProvider<SessionNotifier, String>(SessionNotifier.new);
