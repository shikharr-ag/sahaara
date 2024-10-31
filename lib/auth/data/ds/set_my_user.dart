import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/domain/entity/my_user.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/global/appwrite_consts.dart';
import 'package:sahaara/main.dart';

Future setMyUser(MyUserModel user) {
  return Databases(client)
      .createDocument(
          databaseId: appwriteDBID,
          collectionId: usersCollectionID,
          documentId: user.uid,
          data: user.toJson())
      .then((doc) {
    log('Created New User ${doc.data}', name: 'SetUserLogs');
  });
}

Future isUserOnboarded(WidgetRef ref, {required String uid}) {
  try {
    return Databases(client)
        .getDocument(
            databaseId: appwriteDBID,
            collectionId: usersCollectionID,
            documentId: uid)
        .then((doc) {
      if (doc.data.isNotEmpty) {
        ref.read(myUserNotifier.notifier).setUser(doc.data);
        return true;
      } else {
        return false;
      }
    });
  } catch (er) {
    log('Error: $er', name: 'SetUserLogs');
    return Future(() => false);
  }
}

Stream<MyUserModel> updateUserModel({required String uid}) {
  
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .snapshots()
      .map((doc) => MyUserModel.fromJson(doc.data()!));
}
