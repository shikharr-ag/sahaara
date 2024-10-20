import 'package:cloud_firestore/cloud_firestore.dart';

Stream<Map<String, bool>> getGoalsStream(String journalId) {
  return FirebaseFirestore.instance
      .collection('journals')
      .doc(journalId)
      .snapshots()
      .map((docSnap) {
    return Map.from(docSnap.data()?['goals'])
        .map((k1, v1) => MapEntry(k1.toString(), bool.parse(v1)));
  });
}
