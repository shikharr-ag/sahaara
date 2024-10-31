// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appwrite_login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppwriteLoginStateCWProxy {
  AppwriteLoginState isSigningIn(bool isSigningIn);

  AppwriteLoginState errorMessage(String? errorMessage);

  AppwriteLoginState password(String password);

  AppwriteLoginState email(String email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppwriteLoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppwriteLoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppwriteLoginState call({
    bool? isSigningIn,
    String? errorMessage,
    String? password,
    String? email,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppwriteLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppwriteLoginState.copyWith.fieldName(...)`
class _$AppwriteLoginStateCWProxyImpl implements _$AppwriteLoginStateCWProxy {
  const _$AppwriteLoginStateCWProxyImpl(this._value);

  final AppwriteLoginState _value;

  @override
  AppwriteLoginState isSigningIn(bool isSigningIn) =>
      this(isSigningIn: isSigningIn);

  @override
  AppwriteLoginState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override
  AppwriteLoginState password(String password) => this(password: password);

  @override
  AppwriteLoginState email(String email) => this(email: email);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppwriteLoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppwriteLoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppwriteLoginState call({
    Object? isSigningIn = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return AppwriteLoginState(
      isSigningIn:
          isSigningIn == const $CopyWithPlaceholder() || isSigningIn == null
              ? _value.isSigningIn
              // ignore: cast_nullable_to_non_nullable
              : isSigningIn as bool,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
    );
  }
}

extension $AppwriteLoginStateCopyWith on AppwriteLoginState {
  /// Returns a callable class that can be used as follows: `instanceOfAppwriteLoginState.copyWith(...)` or like so:`instanceOfAppwriteLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppwriteLoginStateCWProxy get copyWith =>
      _$AppwriteLoginStateCWProxyImpl(this);
}
