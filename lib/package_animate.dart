import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaara/auth/data/ds/set_my_user.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/auth/presentation/screen/google_sign_in_page.dart';
import 'package:sahaara/chat/presentation/notifier/get_sahaara_endpoint_notifier.dart';
import 'package:sahaara/chat/presentation/screens/chat_screen.dart';
import 'package:sahaara/global/color_scheme.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/home/presentation/screens/home_screen.dart';
import 'package:sahaara/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:sahaara/smile.dart';
import 'package:sizer/sizer.dart';
import 'package:transition/transition.dart';

class PackageAnimate extends ConsumerStatefulWidget {
  const PackageAnimate({super.key});

  @override
  ConsumerState<PackageAnimate> createState() => _PackageAnimateState();
}

class _PackageAnimateState extends ConsumerState<PackageAnimate> {
  @override
  void initState() {
    super.initState();
    ref.read(getSahaaraEndpointNotifier.notifier).getSaharaEndpoint();
    if (FirebaseAuth.instance.currentUser != null) {
      isUserOnboarded(ref, uid: FirebaseAuth.instance.currentUser!.uid)
          .then((_) async {
        await Future.delayed(17000.ms);
        Navigator.of(context).pushAndRemoveUntil(
            Transition(child: MyHomePage(title: 'title')), (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Breathe ',
                      style: GoogleFonts.fraunces(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                        .animate()
                        .slideY(
                          begin: 1.0,
                          end: -2.0,
                        )
                        .fade(
                          delay: 9000.ms,
                          duration: 2000.ms,
                          curve: Curves.easeOut,
                          begin: 0.0,
                          end: 1.0,
                        )
                        .fade(
                          delay: 13000.ms,
                          duration: 2000.ms,
                          curve: Curves.easeOut,
                          begin: 1.0,
                          end: 0.0,
                        ),
                    Stack(
                      children: [
                        Text(
                          'In',
                          style: GoogleFonts.fraunces(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                            .animate()
                            .slideY(
                              begin: 1.0,
                              end: -2.0,
                            )
                            .fade(
                              delay: 9000.ms,
                              duration: 2000.ms,
                              curve: Curves.easeOut,
                              begin: 0.0,
                              end: 1.0,
                            )
                            .fade(
                              delay: 10900.ms,
                              duration: 100.ms,
                              curve: Curves.easeOut,
                              begin: 1.0,
                              end: 0.0,
                            ),
                        Text(
                          'Out',
                          style: GoogleFonts.fraunces(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                            .animate()
                            .slideY(
                              begin: 1.0,
                              end: -2.0,
                            )
                            .fade(
                              delay: 11000.ms,
                              duration: 2000.ms,
                              curve: Curves.easeOut,
                              begin: 0.0,
                              end: 1.0,
                            )
                            .fade(
                              delay: 13000.ms,
                              duration: 2000.ms,
                              curve: Curves.easeOut,
                              begin: 1.0,
                              end: 0.0,
                            ),
                      ],
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        )
                            .animate()
                            .slideY(
                              delay: 14000.ms,
                              curve: Curves.easeOut,
                              duration: 2000.ms,
                              begin: 0.0,
                              end: -6.0,
                            )
                            .scaleXY(
                              delay: 14000.ms,
                              curve: Curves.easeOut,
                              duration: 2000.ms,
                              begin: 1.0,
                              end: 0.2,
                            )
                            .scale(
                              // Breathe Out
                              delay: 11000.ms,
                              duration: 2000.ms,
                              curve: Curves.easeOut,

                              begin: const Offset(1, 1),
                              end: const Offset(0.66, 0.66),
                            )
                            .scale(
                              // Breathe In
                              delay: 9000.ms,
                              duration: 2000.ms,
                              curve: Curves.easeOut,
                              begin: const Offset(1, 1),
                              end: const Offset(1.5, 1.5),
                            )
                            .slideY(
                              delay: 4000.ms,
                              curve: Curves.easeOut,
                              duration: 3000.ms,
                              begin: 0.0,
                              end: 0.7,
                            )
                            .scale(
                              delay: 5000.ms,
                              duration: 5000.ms,
                              curve: Curves.easeOut,
                              begin: const Offset(1, 1),
                              end: const Offset(12, 12),
                            )
                            .slideX(
                              delay: 1800.ms,
                              curve: Curves.easeOut,
                              duration: 2000.ms,
                              begin: 0.0,
                              end: 1.5,
                            ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color:
                                SahaaraColorScheme.yellowColor.withOpacity(0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const SmileyFaceWidget(
                            smileFactor: 1.0,
                          )
                              .animate()
                              .custom(
                                delay: 9000.ms,
                                duration: 2000.ms,
                                curve: Curves.easeOut,
                                begin: 0.8,
                                end: 1.2,
                                builder: (context, value, child) =>
                                    SmileyFaceWidget(
                                  smileFactor: 1.0,
                                  smileWidth: value,
                                  part: 'Breathe-IN',
                                ),
                              )
                              .slideY(
                                delay: 11000.ms,
                                duration: 2000.ms,
                                curve: Curves.easeOut,
                                end: 0.2,
                              )
                              .slideY(
                                delay: 9000.ms,
                                duration: 2000.ms,
                                curve: Curves.easeOut,
                                end: -0.2,
                              )
                              .fade(
                                delay: 9000.ms,
                                begin: 0.0,
                                end: 1.0,
                              ),
                        )
                            .animate()
                            .slideY(
                              delay: 14000.ms,
                              curve: Curves.easeOut,
                              duration: 2000.ms,
                              begin: 0.0,
                              end: -6.0,
                            )
                            .scaleXY(
                              delay: 14000.ms,
                              curve: Curves.easeOut,
                              duration: 2000.ms,
                              begin: 1.0,
                              end: 0.2,
                            )
                            .slideY(
                              delay: 4000.ms,
                              curve: Curves.easeOut,
                              duration: 3000.ms,
                              begin: 0.0,
                              end: 0.7,
                            )
                            .scale(
                              delay: 5000.ms,
                              duration: 5000.ms,
                              curve: Curves.easeOut,
                              begin: const Offset(1, 1),
                              end: const Offset(12, 12),
                            )
                            .slideX(
                              delay: 1800.ms,
                              curve: Curves.easeOut,
                              duration: 2000.ms,
                              begin: 0.0,
                              end: 1.5,
                            ),
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Sahaara',
                      style: GoogleFonts.fraunces(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ).animate().fade(
                          delay: 2.seconds,
                          curve: Curves.linearToEaseOut,
                          duration: 1000.ms,
                          begin: 1,
                          end: 0.0,
                        ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome to Sahaara',
              style: GoogleFonts.fraunces(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black),
            )
                .animate()
                .slideY(
                  delay: 16000.ms,
                  duration: 1000.ms,
                  curve: Curves.easeInBack,
                  begin: -2,
                  end: -4.5,
                )
                .fadeIn(delay: 16000.ms, duration: 1200.ms),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'आपका अपना एक सहारा',
              style: GoogleFonts.tiroDevanagariHindi(
                  color: SahaaraColorScheme.blackColor.withOpacity(0.6)),
            )
                .animate()
                .slideY(
                  delay: 17500.ms,
                  // delay: 2000.ms,
                  duration: 1000.ms,
                  curve: Curves.easeInBack,
                  begin: -2,
                  end: -4,
                )
                .fadeIn(delay: 17800.ms, duration: 1200.ms),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 90.w,
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    color: AppColors.accentLight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/quotes.png',
                            height: 50,
                            width: 50,
                          ),
                          AutoSizeText(
                            'You are enough just as you are',
                            style: GoogleFonts.fraunces(
                              color: SahaaraColorScheme.blackColor,
                            ),
                            presetFontSizes: [32, 30, 28, 26, 24, 22],
                            maxLines: 3,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '- Meghan Markle',
                              style: GoogleFonts.fraunces(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/bg.png',
                      color: SahaaraColorScheme.blackColor.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 20500.ms, duration: 1200.ms).slideY(
                  delay: 20000.ms,
                  duration: 1000.ms,
                  curve: Curves.easeIn,
                  begin: 0,
                  end: 0.35,
                ),
          ),
          Positioned(
              bottom: 60,
              left: 10.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    Transition(
                      child: const GoogleSignInPage(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    ),
                  );
                  // Navigator.of(context).push(
                  //   Transition(
                  //     child: OnboardingScreen(),
                  //     transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: SahaaraColorScheme.whiteColor,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColors.accent,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(80.w, 70)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: GoogleFonts.fraunces(
                          color: SahaaraColorScheme.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: SahaaraColorScheme.blackColor,
                    )
                  ],
                ),
              )).animate().fadeIn(delay: 22.seconds, duration: 1.seconds),
          Positioned(
            bottom: 10,
            left: 10.w,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  Transition(
                    child: const GoogleSignInPage(
                      isSignIn: true,
                    ),
                    transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                  ),
                );
              },
              style: TextButton.styleFrom(fixedSize: Size(80.w, 40)),
              child: Text.rich(
                TextSpan(
                    text: 'Already have an account ? ',
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: GoogleFonts.fraunces(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    style: GoogleFonts.fraunces(
                      color: SahaaraColorScheme.blackColor,
                    )),
                textAlign: TextAlign.center,
              ),
            ),
          ).animate().fadeIn(delay: 22.seconds, duration: 1.seconds),
        ],
      ),
    );
  }
}
