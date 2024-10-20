import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:sahaara/onboarding/domain/entity/gender_enum.dart';
import 'package:sahaara/onboarding/domain/entity/health_goal_enum.dart';
import 'package:sahaara/onboarding/domain/entity/onboarding_data.dart';

part 'onboarding_data_model.g.dart';
@CopyWith()
class OnboardingDataModel extends OnboardingData {
  const OnboardingDataModel({
    required int currentPage,
    required List<HealthGoal> healthGoals,
    required Gender gender,
    required int age,
    required bool hasSoughtTherapyBefore,
    required bool hasPhysicalDistress,
  }) : super(
          currentPage: currentPage,
          healthGoals: healthGoals,
          gender: gender,
          age: age,
          hasSoughtTherapyBefore: hasSoughtTherapyBefore,
          hasPhysicalDistress: hasPhysicalDistress,
        );

  factory OnboardingDataModel.initial() {
    return OnboardingDataModel(
      currentPage: 0,
      healthGoals: [],
      gender: Gender.others, // Assuming Gender enum has an 'other' option
      age: 0,
      hasSoughtTherapyBefore: false,
      hasPhysicalDistress: false,
    );
  }

  factory OnboardingDataModel.fromJson(Map<String, dynamic> json) {
    return OnboardingDataModel(
      currentPage: json['currentPage'] as int,
      healthGoals: (json['healthGoals'] as List)
          .map((e) =>
              HealthGoal.values.firstWhere((goal) => goal.toString() == e))
          .toList(),
      gender: Gender.values.firstWhere((g) => g.toString() == json['gender']),
      age: json['age'] as int,
      hasSoughtTherapyBefore: json['hasSoughtTherapyBefore'] as bool,
      hasPhysicalDistress: json['hasPhysicalDistress'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'healthGoals': healthGoals.map((e) => e.toString()).toList(),
      'gender': gender.toString(),
      'age': age,
      'hasSoughtTherapyBefore': hasSoughtTherapyBefore,
      'hasPhysicalDistress': hasPhysicalDistress,
    };
  }
}
