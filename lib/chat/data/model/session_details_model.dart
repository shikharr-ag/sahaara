import 'package:sahaara/journals/domain/entity/journal_entry.dart';

import '../../domain/entity/session_details.dart';

class SessionDetailsModel extends SessionDetails {
  const SessionDetailsModel({
    required super.sessionId,
    required super.userId,
    required super.journalId,
    required super.sessionState,
    required super.startedAt,
    required super.endedAt,
    required super.journalState,
  });

  // Factory constructor for default initial values
  factory SessionDetailsModel.initial() {
    return SessionDetailsModel(
      sessionId: '',
      userId: '',
      journalId: '',
      sessionState: SessionState.live,
      startedAt: DateTime.now(),
      endedAt: DateTime.now(),
      journalState: JournalState.initial,
    );
  }

  // Method to create an object from a JSON map (deserialization)
  factory SessionDetailsModel.fromJson(Map<String, dynamic> json) {
    return SessionDetailsModel(
      sessionId: json['sessionId'] ?? '',
      userId: json['userId'] ?? '',
      journalId: json['journalId'] ?? '',
      sessionState: SessionState.values[json['sessionState'] ?? 0],
      startedAt:
          DateTime.parse(json['startedAt'] ?? DateTime.now().toIso8601String()),
      endedAt:
          DateTime.parse(json['endedAt'] ?? DateTime.now().toIso8601String()),
      journalState: JournalState.values[json['journalState'] ?? 0],
    );
  }

  // Method to convert the object to a JSON map (serialization)
  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'userId': userId,
      'journalId': journalId,
      'sessionState': sessionState.index,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt.toIso8601String(),
      'journalState': journalState.index,
    };
  }
}
