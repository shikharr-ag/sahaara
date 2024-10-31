import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/chat/presentation/notifier/chat_mode_notifier.dart';
import 'package:sahaara/chat/presentation/screens/call_chat_screen.dart';
import 'package:sahaara/chat/presentation/screens/chat_screen.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/global/widgets/header.dart';
import 'package:sahaara/journals/presentation/screens/journal_screen.dart';
import 'package:transition/transition.dart';

import '../../../sessions/presentation/screens/sessions_screen.dart';

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.bookmark_add_outlined,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    // ref.read(myUserNotifier.notifier).updateUsers();
    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // final colors = AppColors.v\\\\\\\\\\\\\\;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ...headers,
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: onScrollNotification,
              child: _bottomNavIndex == 0 ? JournalScreen() : SessionsScreen(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        child: Icon(
          Icons.call,
          color: AppColors.primary,
          // color: AppTheme.colorGray,
        ),
        backgroundColor: AppColors.secondaryLight,
        onPressed: () {
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
          ref.read(chatModeNotifier.notifier).switchToCall();
          Navigator.of(context).push(
            Transition(
              child: ChatScreen(),
              transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive ? AppColors.accentDark : AppColors.primaryLight;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FittedBox(
                  child: Text(
                    index == 0 ? "Journals" : 'Sessions',
                    maxLines: 1,
                    style: AppColors.theme.textTheme.bodyMedium!,
                  ),
                ),
              )
            ],
          );
        },
        backgroundColor: AppColors.surface,
        activeIndex: _bottomNavIndex,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
      ),
    );
  }
}
