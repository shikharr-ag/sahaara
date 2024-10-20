import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/global/color_scheme.dart';
import 'package:sahaara/global/page_controller_transitions.dart';
import 'package:sahaara/onboarding/presentation/constants/onboarding_constants.dart';
import 'package:sahaara/onboarding/presentation/notifier/onboarding_notifier.dart';
import 'package:sahaara/onboarding/presentation/screen/onboarding_details.dart';
import 'package:sizer/sizer.dart';
import 'package:transition/transition.dart';

class OnboardingFooterButton extends ConsumerWidget {
  final bool moveForward;
  final int nextPageIndex;
  final PageController pageController;
  const OnboardingFooterButton(
      {super.key,
      required this.moveForward,
      required this.nextPageIndex,
      required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        log('Moving to $nextPageIndex');
        if (nextPageIndex == OnboardingConstants.onboardingLength) {
          Navigator.of(context)
              .pushReplacement(Transition(child: OnboardingDetails()));
        }
        Future.delayed(400.ms).then((_) => ref
            .read(onboardingNotifierProvider.notifier)
            .updateCurrentPage(nextPageIndex));
        pageControllerTransition(pageController, pageIndex: nextPageIndex);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: SahaaraColorScheme.blackColor,
          foregroundColor: SahaaraColorScheme.yellowColor,
          fixedSize: Size(30.w, 80)),
      child: Icon(
        moveForward
            ? Icons.arrow_forward_ios_rounded
            : Icons.arrow_back_ios_rounded,
      ),
    );
  }
}
