import 'package:equatable/equatable.dart';
import 'package:sahaara/journals/domain/entity/journal_entry.dart';

enum SessionState {
  ended,
  paused,
  live,
}



class SessionDetails extends Equatable {
  final String sessionId;
  final String userId;
  final String journalId;
  final SessionState sessionState;
  final DateTime startedAt;
  final DateTime endedAt;
  final JournalState journalState;

  const SessionDetails({
    required this.sessionId,
    required this.userId,
    required this.journalId,
    required this.sessionState,
    required this.startedAt,
    required this.endedAt,
    required this.journalState,
  });

  @override
  List<Object?> get props => [
        sessionId,
        userId,
        journalId,
        sessionState,
        startedAt,
        endedAt,
        journalState,
      ];
}
