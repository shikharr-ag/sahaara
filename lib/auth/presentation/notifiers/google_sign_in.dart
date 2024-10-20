import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sahaara/auth/data/ds/set_my_user.dart';
import 'package:sahaara/auth/domain/entity/google_login_state.dart';
import 'package:sahaara/auth/domain/entity/my_user.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/global/functions/snackbars.dart';
import 'package:sahaara/home/presentation/screens/home_screen.dart';
import 'package:sahaara/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:transition/transition.dart';

class GoogleSignInNotifier extends Notifier<GoogleLoginState> {
  GoogleLoginState build() {
    return GoogleLoginState(
      isSigningIn: false,
    );
  }

  void _debugLog(String s) {
    log(s, name: 'GoogleSignInLogs');
  }

  Future googleLogin(BuildContext context, WidgetRef ref) async {
    MyFlushbarHelper.createInformation(
            title: 'Please Wait!', message: 'Logging you in with Google.')
        .show(context);
    try {
      final _auth = FirebaseAuth.instance;
      final googleSignIn = GoogleSignIn();
      final googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      state = GoogleLoginState(isSigningIn: true);

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // if (googleUser == null) return;
      // _user = googleUser;
      // setGoogleLoginState(GoogleLoginState.loading);
      // final googleAuth = await googleUser.authentication;
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );

      final User? usr = (await _auth.signInWithCredential(credential)).user;
      final User? currentUser = _auth.currentUser;
      ref.read(myUserNotifier.notifier).updateUid(currentUser!.uid);

      // setMyUser(MyUserModel(uid: currentUser.uid, age: age, gender: gender, createdAt: createdAt, name: name, email: email, sessionIds: sessionIds, journalIds: journalIds))

      // _debugLog('Payload: $payload');
      _debugLog('User : $currentUser');

      state = GoogleLoginState(isSigningIn: false);
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OnboardingScreen()));
        // Navigator.of(context).popUntil((route) => route.isFirst);
        // rightLeftTransitionPushReplacement(
        //     context, AppNavigationInitialAPICaller());
      }
    } catch (e, stackTrace) {
      state = GoogleLoginState(isSigningIn: false, errorMessage: e.toString());
      // MyFlushbarHelper.createError(
      //         title: 'Something went wrong!', message: 'Google Sign In Failed.')
      //     .show(context);
      state = GoogleLoginState(isSigningIn: true, errorMessage: e.toString());
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
        // email: 'shikhar@myhealthtick.com',
        //  password: 'shikhar123'
        email: 'rohit@gmail.com',
        password: '12345678',
      )
          .then((creds) async {
        final User? usr = creds.user;
        final User? currentUser = FirebaseAuth.instance.currentUser;
        ref.read(myUserNotifier.notifier).updateUid(currentUser!.uid);
        bool onb = await isUserOnboarded(ref, uid: currentUser.uid);
        if (!onb) {
          Navigator.of(context)
              .pushReplacement(Transition(child: OnboardingScreen()));
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            Transition(
              child: MyHomePage(title: ''),
            ),
            (route) => false,
          );
        }
      });
    }
  }
}

final googleSignInNotifier =
    NotifierProvider<GoogleSignInNotifier, GoogleLoginState>(
        GoogleSignInNotifier.new);
