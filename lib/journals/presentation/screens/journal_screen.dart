import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sahaara/chat/domain/entity/session_details.dart';
import 'package:sahaara/chat/presentation/notifier/call_chat_notifier.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/journals/datasource/get_journal_entries.dart';
import 'package:sahaara/journals/datasource/get_journal_status_stream.dart';
import 'package:sahaara/journals/domain/entity/journal_entry.dart';
import 'package:sahaara/journals/presentation/screens/journal_entry_view_page.dart';
import 'package:transition/transition.dart';

import '../../../auth/presentation/notifiers/my_user_notifier.dart';
import '../widgets/shimmer_widget.dart';

class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen>
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
      "My Morning Reflection",
      "Today's Thoughts",
      "Dear Diary",
      "Mental Check-in",
      "Peaceful Moments",
      "Gratitude Notes",
      "Daily Musings",
      "Mindful Minutes",
      "Self-Discovery",
      "Journey Entry"
    ];
    return titles[Random().nextInt(titles.length)];
  }

  // Generate items with random content
  List<Map<String, dynamic>> generateItems() {
    return List.generate(
      20,
      (index) {
        final subtitleWordCount = Random().nextInt(30) + 20; // 20-50 words
        final subtitle = getLoremIpsum(subtitleWordCount);
        return {
          'id': index,
          'title': generateTitle(),
          'subtitle': subtitle,
          'color': AppColors.calmingGradient[
              Random().nextInt(AppColors.calmingGradient.length - 1)],
          'height':
              100.0 + (subtitle.length / 3), // Dynamic height based on content
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
    final user = ref.watch(myUserNotifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Your Journals',
            style: AppColors.theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<JournalEntryModel>>(
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  );
                } else {
                  if ((snap.data ?? []).isEmpty) {
                    return Center(
                      child: Text('No Journal Entries'),
                    );
                  }
                }
                return MasonryGridView.builder(
                  itemCount: snap.data!.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          Transition(
                            child: JournalEntryViewPage(
                              journalEntry: snap.data![index].toJson(),
                            ),
                          ),
                        );
                      },
                      child: ShimmerContainer(
                        item: snap.data![index].toJson(),
                        color: _items[index]['color'],
                        isLoadingStream: getJournalStatusStream(
                                snap.data![index].journalId)
                            .map((state) => state == JournalState.generating),
                      ).animate().fadeIn(),
                    );
                  },
                );
              },
              future: getJournalEntries(user.journalIds),
            ),
          ),
        ),
      ],
    );
  }
}
