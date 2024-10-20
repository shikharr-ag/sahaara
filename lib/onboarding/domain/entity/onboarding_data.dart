import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:sahaara/onboarding/domain/entity/gender_enum.dart';
import 'package:sahaara/onboarding/domain/entity/health_goal_enum.dart';

import 'package:equatable/equatable.dart';
part 'onboarding_data.g.dart';

@CopyWith()
class OnboardingData extends Equatable {
  final int currentPage;
  final List<HealthGoal> healthGoals;
  final Gender gender;
  final int age;
  final bool hasSoughtTherapyBefore;
  final bool hasPhysicalDistress;

  const OnboardingData({
    required this.currentPage,
    required this.healthGoals,
    required this.gender,
    required this.age,
    required this.hasSoughtTherapyBefore,
    required this.hasPhysicalDistress,
  });

  @override
  List<Object?> get props {
    return [
      currentPage,
      healthGoals,
      gender,
      age,
      hasSoughtTherapyBefore,
      hasPhysicalDistress,
    ];
  }
}
