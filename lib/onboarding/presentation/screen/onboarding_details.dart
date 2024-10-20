import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/data/ds/set_my_user.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/chat/presentation/screens/chat_screen.dart';
import 'package:sahaara/global/functions/snackbars.dart';
import 'package:sahaara/global/page_controller_transitions.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/global/widgets/header.dart';
import 'package:sahaara/onboarding/presentation/widgets/multi_options.dart';
import 'package:sizer/sizer.dart';
import 'package:transition/transition.dart';

class OnboardingDetails extends ConsumerStatefulWidget {
  const OnboardingDetails({super.key});

  @override
  ConsumerState<OnboardingDetails> createState() => _OnboardingDetailsState();
}

class _OnboardingDetailsState extends ConsumerState<OnboardingDetails> {
  final PageController pageController = PageController();
  int age = -1;
  int _selectedGender = 0;
  String name = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: PageView(
          controller: pageController,
          children: [
            Column(
              children: [
                ...headers,
                Text(
                  'How will Sahaara help you ?',
                  textAlign: TextAlign.center,
                  style: AppColors.theme.textTheme.bodyLarge!
                      .copyWith(color: AppColors.secondaryDark, fontSize: 25),
                ),
                Expanded(
                  child: CheckboxList(
                    items: [
                      'I have stress and anxiety',
                      'I have a fear of people',
                      'I need a safe space to vent',
                      'I feel lonely',
                      'Just Exploring'
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    pageController.animateToPage(1,
                        duration: 500.ms, curve: Curves.ease);
                  },
                  child: Text(
                    'NEXT',
                    style: AppColors.theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      backgroundColor: AppColors.surface,
                      fixedSize: Size(70.w, 70)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              children: [
                ...headers,
                Text(
                  'What\'s your official gender ?',
                  textAlign: TextAlign.center,
                  style: AppColors.theme.textTheme.bodyLarge!
                      .copyWith(color: AppColors.secondaryDark, fontSize: 25),
                ),
                Expanded(
                    child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => setState(() => _selectedGender = 0),
                      child: Card(
                        color: _selectedGender == 0
                            ? AppColors.primaryLight
                            : AppColors.background,
                        child: SizedBox(
                            height: 80,
                            child: Icon(
                              Icons.male_rounded,
                              size: 40,
                              color: AppColors.primaryDark,
                            )),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => setState(() => _selectedGender = 1),
                      child: Card(
                        color: _selectedGender == 1
                            ? AppColors.secondaryLight
                            : AppColors.background,
                        child: SizedBox(
                            height: 80,
                            child: Icon(
                              Icons.female_rounded,
                              color: AppColors.secondaryDark,
                              size: 40,
                            )),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => setState(() => _selectedGender = 2),
                      child: Card(
                        color: _selectedGender == 2
                            ? AppColors.accentLight
                            : AppColors.background,
                        child: SizedBox(
                            height: 80,
                            child: Center(
                              child: Text(
                                "Others",
                                style: AppColors.theme.textTheme.bodyLarge!
                                    .copyWith(
                                  color: AppColors.accentDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                    )),
                    Spacer(),
                  ],
                )),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(myUserNotifier.notifier)
                        .updateGender(_selectedGender);
                    pageController.animateToPage(2,
                        duration: 500.ms, curve: Curves.ease);
                  },
                  child: Text(
                    'NEXT',
                    style: AppColors.theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      backgroundColor: AppColors.surface,
                      fixedSize: Size(70.w, 70)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              children: [
                ...headers,
                Text(
                  'What\'s your birth year ?',
                  textAlign: TextAlign.center,
                  style: AppColors.theme.textTheme.bodyLarge!
                      .copyWith(color: AppColors.secondaryDark, fontSize: 25),
                ),
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'In which year were you born ?',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusColor: AppColors.secondaryDark),
                      keyboardType: TextInputType.number,
                      onChanged: (sAge) =>
                          setState(() => age = int.tryParse(sAge) ?? -1),
                      onSubmitted: (sAge) {
                        if ((int.tryParse(sAge) ?? -1) == -1 ||
                            (int.tryParse(sAge) ?? -1) < 1914) {
                          MyFlushbarHelper.createInformation(
                                  message: 'Please enter a valid birth year',
                                  title: 'Invalid Birth Year')
                              .show(context);
                        }
                      },
                    ),
                  ),
                ),
                Spacer(),
                if (age != -1 || age < 1914)
                  ElevatedButton(
                    onPressed: () {
                      ref.read(myUserNotifier.notifier).updateAge(
                            DateTime(age),
                          );
                      pageController.animateToPage(3,
                          duration: 500.ms, curve: Curves.ease);
                    },
                    child: Text(
                      'NEXT',
                      style: AppColors.theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: AppColors.surface,
                        fixedSize: Size(70.w, 70)),
                  ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              children: [
                ...headers,
                Text(
                  'What would you like your "new" friend to call you ?',
                  style: AppColors.theme.textTheme.bodyLarge!
                      .copyWith(color: AppColors.secondaryDark, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText:
                              'Your name / nickname or any other alias :)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          focusColor: AppColors.secondaryDark),
                      keyboardType: TextInputType.text,
                      onChanged: (n) => setState(() => name = n),
                      onSubmitted: (n) {
                        if (n.isEmpty) {
                          MyFlushbarHelper.createInformation(
                                  message: 'Please enter your name',
                                  title: 'No Name Provided')
                              .show(context);
                        }
                      },
                    ),
                  ),
                ),
                Spacer(),
                if (name.isNotEmpty)
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      ref.read(myUserNotifier.notifier).updateName(
                            name,
                          );
                      await setMyUser(ref.read(myUserNotifier));
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).pushAndRemoveUntil(
                          Transition(child: ChatScreen()), (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: AppColors.surface,
                        fixedSize: Size(70.w, 70)),
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryDark,
                            ),
                          )
                        : Text(
                            'DONE',
                            style:
                                AppColors.theme.textTheme.bodyMedium!.copyWith(
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
