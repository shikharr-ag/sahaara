import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahaara/journals/domain/entity/journal_entry.dart';

Future<void> writeJournalEntry(JournalEntryModel journalEntry) async {
  try {
    // Reference to Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the 'journals' collection
    CollectionReference journalsCollection = firestore.collection('journals');

    // Convert JournalEntryModel to JSON
    Map<String, dynamic> journalData = journalEntry.toJson();

    // Write the journal entry to Firestore
    await journalsCollection.add(journalData);

    print('Journal entry successfully added to Firestore');
  } catch (e) {
    // Handle errors if the write operation fails
    print('Failed to write journal entry: $e');
  }
}

void addJournal() async {
  JournalEntryModel journalEntry = JournalEntryModel(
    journalId: 'journal123',
    journalContent: 'This is my first journal entry.',
    journalNumber: 1,
    journalTitle: 'My First Journal',
    goalsState: {'goal1': true, 'goal2': false},
    createdAt: DateTime.now(),
    createdByUser: true,
    journalState: JournalState.initial,
  );

  await writeJournalEntry(journalEntry);
}
