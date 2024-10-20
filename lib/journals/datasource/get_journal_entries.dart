import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sahaara/journals/domain/entity/journal_entry.dart';

Future<List<JournalEntryModel>> getJournalEntries(List<String> ids) async {
  List<JournalEntryModel> models = [];
  log('Checking for $ids');

  try {
    // Use Future.wait to wait for all Firestore calls to complete
    await Future.wait(ids.map((id) async {
      final data = await FirebaseFirestore.instance
          .collection('journals')
          .doc(id)
          .get();

      if (data.exists) {
        log('Data exists ${data.data()}');
        models.add(JournalEntryModel.fromJson(data.data()!));
      }
    }));

    log('Models: $models');
  } catch (e) {
    log('Error fetching journal entries: $e');
  }

  return models;
}
