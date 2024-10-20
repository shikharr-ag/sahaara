// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OnboardingDataCWProxy {
  OnboardingData currentPage(int currentPage);

  OnboardingData healthGoals(List<HealthGoal> healthGoals);

  OnboardingData gender(Gender gender);

  OnboardingData age(int age);

  OnboardingData hasSoughtTherapyBefore(bool hasSoughtTherapyBefore);

  OnboardingData hasPhysicalDistress(bool hasPhysicalDistress);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OnboardingData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OnboardingData(...).copyWith(id: 12, name: "My name")
  /// ````
  OnboardingData call({
    int? currentPage,
    List<HealthGoal>? healthGoals,
    Gender? gender,
    int? age,
    bool? hasSoughtTherapyBefore,
    bool? hasPhysicalDistress,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOnboardingData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOnboardingData.copyWith.fieldName(...)`
class _$OnboardingDataCWProxyImpl implements _$OnboardingDataCWProxy {
  const _$OnboardingDataCWProxyImpl(this._value);

  final OnboardingData _value;

  @override
  OnboardingData currentPage(int currentPage) => this(currentPage: currentPage);

  @override
  OnboardingData healthGoals(List<HealthGoal> healthGoals) =>
      this(healthGoals: healthGoals);

  @override
  OnboardingData gender(Gender gender) => this(gender: gender);

  @override
  OnboardingData age(int age) => this(age: age);

  @override
  OnboardingData hasSoughtTherapyBefore(bool hasSoughtTherapyBefore) =>
      this(hasSoughtTherapyBefore: hasSoughtTherapyBefore);

  @override
  OnboardingData hasPhysicalDistress(bool hasPhysicalDistress) =>
      this(hasPhysicalDistress: hasPhysicalDistress);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OnboardingData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OnboardingData(...).copyWith(id: 12, name: "My name")
  /// ````
  OnboardingData call({
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? healthGoals = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? age = const $CopyWithPlaceholder(),
    Object? hasSoughtTherapyBefore = const $CopyWithPlaceholder(),
    Object? hasPhysicalDistress = const $CopyWithPlaceholder(),
  }) {
    return OnboardingData(
      currentPage:
          currentPage == const $CopyWithPlaceholder() || currentPage == null
              ? _value.currentPage
              // ignore: cast_nullable_to_non_nullable
              : currentPage as int,
      healthGoals:
          healthGoals == const $CopyWithPlaceholder() || healthGoals == null
              ? _value.healthGoals
              // ignore: cast_nullable_to_non_nullable
              : healthGoals as List<HealthGoal>,
      gender: gender == const $CopyWithPlaceholder() || gender == null
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as Gender,
      age: age == const $CopyWithPlaceholder() || age == null
          ? _value.age
          // ignore: cast_nullable_to_non_nullable
          : age as int,
      hasSoughtTherapyBefore:
          hasSoughtTherapyBefore == const $CopyWithPlaceholder() ||
                  hasSoughtTherapyBefore == null
              ? _value.hasSoughtTherapyBefore
              // ignore: cast_nullable_to_non_nullable
              : hasSoughtTherapyBefore as bool,
      hasPhysicalDistress:
          hasPhysicalDistress == const $CopyWithPlaceholder() ||
                  hasPhysicalDistress == null
              ? _value.hasPhysicalDistress
              // ignore: cast_nullable_to_non_nullable
              : hasPhysicalDistress as bool,
    );
  }
}

extension $OnboardingDataCopyWith on OnboardingData {
  /// Returns a callable class that can be used as follows: `instanceOfOnboardingData.copyWith(...)` or like so:`instanceOfOnboardingData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OnboardingDataCWProxy get copyWith => _$OnboardingDataCWProxyImpl(this);
}
