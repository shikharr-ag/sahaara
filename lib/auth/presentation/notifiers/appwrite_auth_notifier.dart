import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/domain/entity/appwrite_login_state.dart';

import 'package:sahaara/global/functions/snackbars.dart';
import 'package:sahaara/main.dart';
import 'package:sahaara/onboarding/presentation/screen/onboarding_screen.dart';

import '../../data/ds/set_my_user.dart';
import '../../domain/entity/my_user.dart';
import 'my_user_notifier.dart';

class AppwriteAuthNotifier extends Notifier<AppwriteLoginState> {
  AppwriteLoginState build() {
    return AppwriteLoginState(
      isSigningIn: false,
      email: '',
      password: '',
    );
  }

  void _debugLog(String s) {
    log(s, name: 'GoogleSignInLogs');
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPass(String pass) {
    state = state.copyWith(password: pass);
  }

  Future googleLogin(BuildContext context, WidgetRef ref) async {
    MyFlushbarHelper.createInformation(
            title: 'Please Wait!', message: 'Logging you in with Google.')
        .show(context);
    try {
      final _auth = Account(client);
      final session = await _auth.createEmailPasswordSession(
          email: state.email, password: state.password);
      log('Session Details; ${session.toMap()}');
       // _auth.create(userId: ID.unique(),email: );
      // final User? usr = (await _auth.signInWithCredential(credential)).user;
      // final User? currentUser = _auth.currentUser;
      ref.read(myUserNotifier.notifier).updateUid(session.userId);

      // setMyUser(MyUserModel(uid: session.userId, age: age, gender: gender, createdAt: createdAt, name: name, email: email, sessionIds: sessionIds, journalIds: journalIds))

      // _debugLog('Payload: $payload');
      // _debugLog('User : $currentUser');

      // state = GoogleLoginState(isSigningIn: false);
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OnboardingScreen()));
        // Navigator.of(context).popUntil((route) => route.isFirst);
        // rightLeftTransitionPushReplacement(
        //     context, AppNavigationInitialAPICaller());
      }
    } catch (e, stackTrace) {
      // state = GoogleLoginState(isSigningIn: false, errorMessage: e.toString());
      // MyFlushbarHelper.createError(
      //         title: 'Something went wrong!', message: 'Google Sign In Failed.')
      //     .show(context);
      // state = GoogleLoginState(isSigningIn: true, errorMessage: e.toString());
      //     FirebaseAuth.instance
      //         .signInWithEmailAndPassword(
      //       // email: 'shikhar@myhealthtick.com',
      //       //  password: 'shikhar123'
      //       email: 'a@b.com',
      //       password: '123456',
      //     )
      //         .then((creds) async {
      //       final User? usr = creds.user;
      //       final User? currentUser = FirebaseAuth.instance.currentUser;
      //       ref.read(myUserNotifier.notifier).updateUid(currentUser!.uid);
      //       bool onb = await isUserOnboarded(ref, uid: currentUser.uid);
      //       if (!onb) {
      //         Navigator.of(context)
      //             .pushReplacement(Transition(child: OnboardingScreen()));
      //       } else {
      //         Navigator.of(context).pushAndRemoveUntil(
      //           Transition(
      //             child: MyHomePage(title: ''),
      //           ),
      //           (route) => false,
      //         );
      //       }
      //     });
      //   }
    }
  }
}

final appwriteAuthNotifier =
    NotifierProvider<AppwriteAuthNotifier, AppwriteLoginState>(
        AppwriteAuthNotifier.new);
