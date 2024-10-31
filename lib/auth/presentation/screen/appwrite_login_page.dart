import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaara/auth/presentation/notifiers/appwrite_auth_notifier.dart';
import 'package:sahaara/global/color_scheme.dart';
import 'package:sahaara/global/functions/snackbars.dart';

import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/global/widgets/header.dart';
import 'package:sahaara/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:transition/transition.dart';

class AppwriteSignInPage extends ConsumerStatefulWidget {
  const AppwriteSignInPage({super.key, this.isSignIn = false});
  final bool isSignIn;
  @override
  ConsumerState<AppwriteSignInPage> createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends ConsumerState<AppwriteSignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final googleState = ref.watch(appwriteAuthNotifier);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...headers,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.isSignIn ? 'Welcome Back' : 'Welcome',
                    style: AppColors.theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.accentDark,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.isSignIn
                        ? 'Sahaara is waiting to talk to you.. :)'
                        : 'Sign up quickly, a friend is waiting for you',
                    style: AppColors.theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.accent,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Card(
                  color: const Color.fromARGB(255, 251, 242, 248),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: GoogleFonts.urbanist(
                              color: AppColors.accentDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          style: GoogleFonts.urbanist(
                            color: AppColors.primaryDark,
                          ),
                          cursorColor: AppColors.background,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle:
                                GoogleFonts.urbanist(color: Colors.black38),
                            contentPadding:
                                const EdgeInsets.only(top: 16, left: 12),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.secondary,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.accentDark,
                              ),
                            ),
                          ),
                          controller: emailController,
                          onChanged: (email) => ref
                              .read(appwriteAuthNotifier.notifier)
                              .setEmail(email),
                          onSubmitted: (email) => ref
                              .read(appwriteAuthNotifier.notifier)
                              .setEmail(email),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: GoogleFonts.urbanist(
                              color: AppColors.accentDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          style: GoogleFonts.urbanist(
                            color: AppColors.primaryDark,
                          ),
                          cursorColor: AppColors.background,
                          decoration: InputDecoration(
                            hintText: "Enter your super secret password",
                            hintStyle:
                                GoogleFonts.urbanist(color: Colors.black38),
                            contentPadding: EdgeInsets.only(top: 16, left: 12),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.secondary,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.accentDark,
                              ),
                            ),
                          ),
                          controller: passController,
                          onChanged: (pass) => ref
                              .read(appwriteAuthNotifier.notifier)
                              .setPass(pass),
                          onSubmitted: (pass) => ref
                              .read(appwriteAuthNotifier.notifier)
                              .setPass(pass),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: (emailController.text.isNotEmpty &&
                                  passController.text.isNotEmpty)
                              ? () {
                                  ref
                                      .read(appwriteAuthNotifier.notifier)
                                      .googleLogin(context, ref);
                                }
                              : () => MyFlushbarHelper.createInformation(
                                      message: 'Please enter your credentials')
                                  .show(context),
                          style:
                              TextButton.styleFrom(fixedSize: Size(70.w, 70)),
                          child: googleState.isSigningIn
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryDark,
                                  ),
                                )
                              : Text(
                                  'Login',
                                  style: AppColors.theme.textTheme.bodyMedium!
                                      .copyWith(
                                          color: AppColors.primaryDark,
                                          fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (widget.isSignIn)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        Transition(
                          child: OnboardingScreen(),
                          transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                        ),
                      );
                    },
                    style: TextButton.styleFrom(fixedSize: Size(80.w, 40)),
                    child: Text.rich(
                      TextSpan(
                          text: 'Not a user ? ',
                          children: [
                            TextSpan(
                              text: 'Sign Up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
