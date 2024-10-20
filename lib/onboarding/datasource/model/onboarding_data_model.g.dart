// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OnboardingDataModelCWProxy {
  OnboardingDataModel currentPage(int currentPage);

  OnboardingDataModel healthGoals(List<HealthGoal> healthGoals);

  OnboardingDataModel gender(Gender gender);

  OnboardingDataModel age(int age);

  OnboardingDataModel hasSoughtTherapyBefore(bool hasSoughtTherapyBefore);

  OnboardingDataModel hasPhysicalDistress(bool hasPhysicalDistress);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OnboardingDataModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OnboardingDataModel(...).copyWith(id: 12, name: "My name")
  /// ````
  OnboardingDataModel call({
    int? currentPage,
    List<HealthGoal>? healthGoals,
    Gender? gender,
    int? age,
    bool? hasSoughtTherapyBefore,
    bool? hasPhysicalDistress,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOnboardingDataModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOnboardingDataModel.copyWith.fieldName(...)`
class _$OnboardingDataModelCWProxyImpl implements _$OnboardingDataModelCWProxy {
  const _$OnboardingDataModelCWProxyImpl(this._value);

  final OnboardingDataModel _value;

  @override
  OnboardingDataModel currentPage(int currentPage) =>
      this(currentPage: currentPage);

  @override
  OnboardingDataModel healthGoals(List<HealthGoal> healthGoals) =>
      this(healthGoals: healthGoals);

  @override
  OnboardingDataModel gender(Gender gender) => this(gender: gender);

  @override
  OnboardingDataModel age(int age) => this(age: age);

  @override
  OnboardingDataModel hasSoughtTherapyBefore(bool hasSoughtTherapyBefore) =>
      this(hasSoughtTherapyBefore: hasSoughtTherapyBefore);

  @override
  OnboardingDataModel hasPhysicalDistress(bool hasPhysicalDistress) =>
      this(hasPhysicalDistress: hasPhysicalDistress);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OnboardingDataModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OnboardingDataModel(...).copyWith(id: 12, name: "My name")
  /// ````
  OnboardingDataModel call({
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? healthGoals = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? age = const $CopyWithPlaceholder(),
    Object? hasSoughtTherapyBefore = const $CopyWithPlaceholder(),
    Object? hasPhysicalDistress = const $CopyWithPlaceholder(),
  }) {
    return OnboardingDataModel(
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

extension $OnboardingDataModelCopyWith on OnboardingDataModel {
  /// Returns a callable class that can be used as follows: `instanceOfOnboardingDataModel.copyWith(...)` or like so:`instanceOfOnboardingDataModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OnboardingDataModelCWProxy get copyWith =>
      _$OnboardingDataModelCWProxyImpl(this);
}
