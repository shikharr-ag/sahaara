import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'journal_entry.g.dart';

enum JournalState {
  initial,
  generated,
  generating,
}

@CopyWith()
class JournalEntryModel extends Equatable {
  final String journalId;
  final String journalContent;
  final int journalNumber; // Fixed typo: jounralNumber -> journalNumber
  final String journalTitle;
  final Map<String, bool> goalsState;
  final DateTime createdAt;
  final bool createdByUser;
  final JournalState journalState; // Added journalState field

  const JournalEntryModel({
    required this.journalId,
    required this.journalContent,
    required this.journalNumber,
    required this.journalTitle,
    required this.goalsState,
    required this.createdAt,
    required this.createdByUser,
    required this.journalState, // Included journalState in the constructor
  });

  factory JournalEntryModel.fromJson(Map<String, dynamic> json) {
    return JournalEntryModel(
      journalId: json['journalId'] as String,
      journalContent: json['journalContent'] as String,
      journalNumber: (json['journalNumber'] ?? 1) as int,
      journalTitle: json['journalTitle'] as String,
      goalsState: Map<String, bool>.from(json['goals'] ?? {}),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdByUser: json['createdByUser'] as bool,
      journalState: JournalState.values.firstWhere(
          (e) => e.toString() == 'JournalState.${json['journal_status']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'goals':goalsState,
      'journalId': journalId,
      'journalContent': journalContent,
      'journalNumber': journalNumber,
      'journalTitle': journalTitle,
      'goalsState': goalsState,
      'createdAt': createdAt.toIso8601String(),
      'createdByUser': createdByUser,
      'journalState':
          journalState.toString().split('.').last, // Save the enum as a string
    };
  }

  @override
  List<Object?> get props => [
        journalId,
        journalContent,
        journalNumber,
        journalTitle,
        goalsState,
        createdAt,
        createdByUser,
        journalState, // Include journalState in props
      ];
}
