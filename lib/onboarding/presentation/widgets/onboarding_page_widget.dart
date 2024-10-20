import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaara/global/color_scheme.dart';
import 'package:sahaara/onboarding/domain/entity/onboarding_data.dart';
import 'package:sahaara/onboarding/presentation/constants/onboarding_constants.dart';
import 'package:sahaara/onboarding/presentation/notifier/onboarding_notifier.dart';
import 'package:sahaara/onboarding/presentation/widgets/onboarding_footer_button.dart';
import 'package:sizer/sizer.dart';

class OnboardingPageIntroductionWidget extends ConsumerStatefulWidget {
  final PageController pageController;
  final OnboardingData onboardingData;
  final int index;
  const OnboardingPageIntroductionWidget({
    super.key,
    required this.pageController,
    required this.onboardingData,
    required this.index,
  });

  @override
  ConsumerState<OnboardingPageIntroductionWidget> createState() =>
      _OnboardingPageIntroductionWidgetState();
}

class _OnboardingPageIntroductionWidgetState
    extends ConsumerState<OnboardingPageIntroductionWidget> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(200.ms).then((_) {
        setState(() {
          opacity = 1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final onboardingData = ref.watch(onboardingNotifierProvider);
    return AnimatedOpacity(
      opacity: opacity,
      duration: 400.ms,
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              OnboardingConstants.introductionScreenAssets[widget.index],
              fit: BoxFit.fill,
              width: 100.w,
              height: 100.w,
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 80.w,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: SahaaraColorScheme.blackColor, width: 2),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        height: 20,
                        width: ((onboardingData.currentPage + 1) /
                                OnboardingConstants.onboardingLength) *
                            80.w,
                        margin: EdgeInsets.only(
                            top: 2.5, left: 10.w + 2, right: 10.w + 2),
                        duration: 400.ms,
                        curve: Curves.easeIn,
                        decoration: BoxDecoration(
                          color: SahaaraColorScheme.yellowColor,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Text(
                      OnboardingConstants.introductionScreenText[widget.index],
                      style: GoogleFonts.urbanist(
                        color: SahaaraColorScheme.blackColor,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (widget.index > 0)
                          OnboardingFooterButton(
                              moveForward: false,
                              nextPageIndex: widget.index - 1,
                              pageController: widget.pageController),
                        OnboardingFooterButton(
                            moveForward: true,
                            nextPageIndex: widget.index + 1,
                            pageController: widget.pageController),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
