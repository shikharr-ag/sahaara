import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_notifier.dart';
import 'package:sahaara/chat/presentation/screens/text_chat_screen.dart';
import 'package:sahaara/global/extension/date_time_extension.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/journals/presentation/screens/journal_entry_view_page.dart';
import 'package:transition/transition.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  // Lorem Ipsum text generator
  String getLoremIpsum(int wordCount) {
    const loremIpsum = '''
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    ''';
    final words = loremIpsum.trim().split(' ');
    return words.take(wordCount).join(' ');
  }

  // Title generator
  String generateTitle() {
    final titles = [
      "Session 1 (${DateTime.now().toLongDate()})",
      "Session 2 (${DateTime.now().toLongDate()})",
      "Session 3 (${DateTime.now().toLongDate()})"
    ];
    return titles[Random().nextInt(titles.length)];
  }

  // Generate items with random content
  List<Map<String, dynamic>> generateItems() {
    return List.generate(
      20,
      (index) {
        // final subtitleWordCount = ; // 20-50 words
        final subtitle = DateTime.now().subtract(index.days).toLongDate();
        return {
          'id': index,
          'title': 'Session ${index + 1}',
          'subtitle': subtitle,
          'color': AppColors.calmingGradient[
              Random().nextInt(AppColors.calmingGradient.length - 1)],
          'height': 40 +
              (Random().nextInt(40) + 20), // Dynamic height based on content
        };
      },
    );
  }

  late final List<Map<String, dynamic>> _items;

  @override
  void initState() {
    super.initState();
    _items = generateItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Your Sessions',
            style: AppColors.theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MasonryGridView.builder(
              itemCount: _items.length,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(Transition(child: TextChatScreen(),transitionEffect: TransitionEffect.RIGHT_TO_LEFT,),);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => JournalEntryViewPage(
                    //       journalEntry: _items[index],
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: _items[index]['height'],
                    decoration: BoxDecoration(
                      color: _items[index]['color'],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _items[index]['title'],
                            style:
                                AppColors.theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _items[index]['subtitle'],
                            style:
                                AppColors.theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 8,
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
