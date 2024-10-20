import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/data/ds/set_my_user.dart';
import 'package:sahaara/auth/domain/entity/my_user.dart';

class MyUserNotifier extends Notifier<MyUserModel> {
  StreamSubscription? _updateUserModel;

  @override
  MyUserModel build() {
    return MyUserModel.initial();
  }

  void updateUsers() {
    _updateUserModel =
        updateUserModel(uid: state.uid).listen((user) => state = user);
  }

  void closeStream() {
    _updateUserModel?.cancel();
    _updateUserModel = null;
  }

  void setUser(Map<String, dynamic> data) {
    state = MyUserModel.fromJson(data);
  }

  void updateUid(String uid) {
    state = state.copyWith(uid: uid, createdAt: DateTime.now());
  }

  void updateGender(int i) {
    state = state.copyWith(
        gender: i == 0
            ? 'male'
            : i == 1
                ? 'female'
                : 'others');
  }

  void updateReasons(List<String> r) {
    state = state.copyWith(reasons: r);
  }

  void updateAge(DateTime year) {
    state = state.copyWith(age: DateTime.now().year - year.year);
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }
}

final myUserNotifier =
    NotifierProvider<MyUserNotifier, MyUserModel>(MyUserNotifier.new);
