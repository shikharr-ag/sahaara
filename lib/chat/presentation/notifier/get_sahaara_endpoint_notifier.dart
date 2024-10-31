import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahaara/main.dart';

class GetSaharaEndpointNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  Future getSaharaEndpoint() async {
    // state =
    state = await Databases(client)
        .listDocuments(
            databaseId: '672362c100297eba5a0c',
            collectionId: '67236a10001a3208a058')
        .then((docList) {
      docList.documents.forEach((doc) {
        log('Doc: ${doc.data}', name: 'GetSahaaraLogs');
      });
      return docList.documents.first.data['sahara_endpoint'] ??
          'http://10.156.114.253:8000/ask';
    });
  }
}

final getSahaaraEndpointNotifier =
    NotifierProvider<GetSaharaEndpointNotifier, String>(
        GetSaharaEndpointNotifier.new);
