import 'package:cloud_firestore/cloud_firestore.dart';

Future updateGoalsStream(String journalId, String key) {
  return FirebaseFirestore.instance
      .collection('journals')
      .doc(journalId)
      .get().then((docSnap)async{
        Map<String,bool> goals = Map.from(docSnap.data()?['goals'])
        .map((k1, v1) => MapEntry(k1.toString(), bool.parse(v1)));

        goals[key] =!goals[key]!;

        await docSnap.reference.update({'goals':goals});
      });
     
}