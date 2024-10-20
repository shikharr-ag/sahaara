import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/presentation/notifiers/google_sign_in.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/global/widgets/header.dart';
import 'package:sizer/sizer.dart';

class GoogleSignInPage extends ConsumerStatefulWidget {
  const GoogleSignInPage({super.key, this.isSignIn = false});
  final bool isSignIn;
  @override
  ConsumerState<GoogleSignInPage> createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends ConsumerState<GoogleSignInPage> {
  @override
  Widget build(BuildContext context) {
    final googleState = ref.watch(googleSignInNotifier);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
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
                 widget.isSignIn ? 'Sahaara is waiting to talk to you.. :)' : 'Sign up quickly, a friend is waiting for you',
                  style: AppColors.theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.accent,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(googleSignInNotifier.notifier)
                      .googleLogin(context, ref);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    backgroundColor: AppColors.surface,
                    fixedSize: Size(70.w, 70)),
                child: googleState.isSigningIn
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      )
                    : Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/gogle.png'),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Sign In With Google',
                            style: AppColors.theme.textTheme.bodyMedium!
                                .copyWith(
                                    color: AppColors.primaryDark, fontSize: 18),
                          ),
                        ],
                      ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
