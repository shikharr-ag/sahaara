import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaara/global/color_scheme.dart';
import 'package:sahaara/onboarding/presentation/constants/onboarding_constants.dart';
import 'package:sahaara/onboarding/presentation/notifier/onboarding_notifier.dart';
import 'package:sahaara/onboarding/presentation/widgets/onboarding_page_widget.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: List.generate(
            OnboardingConstants.onboardingLength,
            (index) => OnboardingPageIntroductionWidget(
                pageController: pageController,
                onboardingData: ref.read(
                  onboardingNotifierProvider,
                ),
                index: index)),
      ),
    );
  }
}
