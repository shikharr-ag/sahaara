// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MyUserModelCWProxy {
  MyUserModel reasons(List<String> reasons);

  MyUserModel uid(String uid);

  MyUserModel age(int age);

  MyUserModel gender(String gender);

  MyUserModel createdAt(DateTime createdAt);

  MyUserModel name(String name);

  MyUserModel email(String email);

  MyUserModel sessionIds(List<String> sessionIds);

  MyUserModel journalIds(List<String> journalIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyUserModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyUserModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MyUserModel call({
    List<String>? reasons,
    String? uid,
    int? age,
    String? gender,
    DateTime? createdAt,
    String? name,
    String? email,
    List<String>? sessionIds,
    List<String>? journalIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMyUserModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMyUserModel.copyWith.fieldName(...)`
class _$MyUserModelCWProxyImpl implements _$MyUserModelCWProxy {
  const _$MyUserModelCWProxyImpl(this._value);

  final MyUserModel _value;

  @override
  MyUserModel reasons(List<String> reasons) => this(reasons: reasons);

  @override
  MyUserModel uid(String uid) => this(uid: uid);

  @override
  MyUserModel age(int age) => this(age: age);

  @override
  MyUserModel gender(String gender) => this(gender: gender);

  @override
  MyUserModel createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  MyUserModel name(String name) => this(name: name);

  @override
  MyUserModel email(String email) => this(email: email);

  @override
  MyUserModel sessionIds(List<String> sessionIds) =>
      this(sessionIds: sessionIds);

  @override
  MyUserModel journalIds(List<String> journalIds) =>
      this(journalIds: journalIds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyUserModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyUserModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MyUserModel call({
    Object? reasons = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
    Object? age = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? sessionIds = const $CopyWithPlaceholder(),
    Object? journalIds = const $CopyWithPlaceholder(),
  }) {
    return MyUserModel(
      reasons: reasons == const $CopyWithPlaceholder() || reasons == null
          ? _value.reasons
          // ignore: cast_nullable_to_non_nullable
          : reasons as List<String>,
      uid: uid == const $CopyWithPlaceholder() || uid == null
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String,
      age: age == const $CopyWithPlaceholder() || age == null
          ? _value.age
          // ignore: cast_nullable_to_non_nullable
          : age as int,
      gender: gender == const $CopyWithPlaceholder() || gender == null
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as String,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      sessionIds:
          sessionIds == const $CopyWithPlaceholder() || sessionIds == null
              ? _value.sessionIds
              // ignore: cast_nullable_to_non_nullable
              : sessionIds as List<String>,
      journalIds:
          journalIds == const $CopyWithPlaceholder() || journalIds == null
              ? _value.journalIds
              // ignore: cast_nullable_to_non_nullable
              : journalIds as List<String>,
    );
  }
}

extension $MyUserModelCopyWith on MyUserModel {
  /// Returns a callable class that can be used as follows: `instanceOfMyUserModel.copyWith(...)` or like so:`instanceOfMyUserModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MyUserModelCWProxy get copyWith => _$MyUserModelCWProxyImpl(this);
}
