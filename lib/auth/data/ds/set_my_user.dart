import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/domain/entity/my_user.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';

Future setMyUser(MyUserModel user) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .set(user.toJson());
}

Future isUserOnboarded(WidgetRef ref, {required String uid}) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((doc) {
    if (doc.exists) {
      ref.read(myUserNotifier.notifier).setUser(doc.data()!);
      return true;
    } else {
      return false;
    }
  });
}

Stream<MyUserModel> updateUserModel({required String uid}) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .snapshots()
      .map((doc) => MyUserModel.fromJson(doc.data()!));
}
