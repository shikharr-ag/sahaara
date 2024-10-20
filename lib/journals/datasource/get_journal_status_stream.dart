import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahaara/journals/domain/entity/journal_entry.dart';

Stream<JournalState> getJournalStatusStream(String journalId) {
  return FirebaseFirestore.instance
      .collection('journals')
      .doc(journalId)
      .snapshots()
      .map((docSnap) {
    return JournalState.values.firstWhere((val) => val.name.toLowerCase()==docSnap.data()?['journal_status'].toString().toLowerCase()) ;
  });
}
