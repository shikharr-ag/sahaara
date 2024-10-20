import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sahaara/chat/presentation/screens/text_chat_screen.dart';
import 'package:sahaara/global/extension/date_time_extension.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sahaara/global/widgets/markdown_text.dart';

//     '''<beginning happy/>Today was an **amazing** day! I started my morning with a _refreshing_ walk.{n}

// <body energetic/>I attended an interesting workshop on [Flutter Development](https://flutter.dev). The instructor was {ul}incredibly knowledgeable{ul} and I learned so many new things. The {ulb}highlight{ulb} of the session was building real-world applications.{n}

// <ending peaceful/>Finally, I wrapped up the day by practicing what I learned. _Can't wait_ for tomorrow's session!''';

class JournalEntryViewPage extends StatelessWidget {
  final Map<String, dynamic> journalEntry;

  const JournalEntryViewPage({
    super.key,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context) {
    log('Journal: $journalEntry');
    String sampleMarkdownText = journalEntry['journalContent'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColors.textPrimary,
          onPressed: () => Navigator.pop(context),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.edit_outlined),
        //     color: AppColors.textPrimary,
        //     onPressed: () {
        //       // TODO: Implement edit functionality
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.delete_outline),
        //     color: AppColors.textPrimary,
        //     onPressed: () {
        //       // Show delete confirmation dialog
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: const Text('Delete Entry?'),
        //         content: const Text(
        //           'Are you sure you want to delete this journal entry? This action cannot be undone.',
        //         ),
        //         actions: [
        //           TextButton(
        //             child: const Text('Cancel'),
        //             onPressed: () => Navigator.of(context).pop(),
        //           ),
        //           TextButton(
        //             child: const Text(
        //               'Delete',
        //               style: TextStyle(color: Colors.red),
        //             ),
        //             onPressed: () {
        //               // TODO: Implement delete functionality
        //               Navigator.of(context).pop();
        //               Navigator.of(context).pop();
        //             },
        //           ),
        //         ],
        //       );
        //     },
        //   );
        // },
        //   ),
        //   const SizedBox(width: 8),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                journalEntry['journalTitle'],
                style: AppColors.theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),

              // Date and Time
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    DateTime.parse(journalEntry['createdAt'] ??
                            DateTime.now().toIso8601String())
                        .toLongDate(), // Replace with actual date
                    style: AppColors.theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // // Mood Indicator (if applicable)
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 12,
              //     vertical: 6,
              //   ),
              //   decoration: BoxDecoration(
              //     color: AppColors.calmingGradient[0].withOpacity(0.2),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Icon(
              //         Icons.mood_rounded,
              //         size: 20,
              //         color: AppColors.textSecondary,
              //       ),
              //       const SizedBox(width: 8),
              //       Text(
              //         'Feeling Calm', // Replace with actual mood
              //         style: AppColors.theme.textTheme.bodyMedium?.copyWith(
              //           color: AppColors.textSecondary,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 24),

              // Content
              MarkdownText(markdownData: sampleMarkdownText),

              // Optional: Tags or Categories
              const SizedBox(height: 32),
              // Wrap(
              //   spacing: 8,
              //   runSpacing: 8,
              //   children: ['Personal', 'Reflection', 'Growth']
              //       .map((tag) => Chip(
              //             label: Text(
              //               tag,
              //               style:
              //                   AppColors.theme.textTheme.bodyMedium?.copyWith(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 12,
              //               ),
              //             ),
              //             backgroundColor:
              //                 AppColors.focusGradient[2].withOpacity(0.1),
              //           ))
              //       .toList(),
              // ),
              // Optional: Tags or Categories
              // const SizedBox(height: 32),
              if (((journalEntry['goals'] ?? {}) as Map).isNotEmpty) ...[
                Text(
                  'Goals',
                  style: AppColors.theme.textTheme.bodyMedium!,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                    children: List.generate(
                  journalEntry['goals'].length,
                  (i) => _buildGoalRow(
                    journalEntry['goals'].keys.toList()[i],
                    journalEntry['goals'].values.toList()[i],
                  ),
                )),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalRow(String text, bool state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 22,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: state ? AppColors.primary : AppColors.background,
              border: Border.all(color: AppColors.accent),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: AppColors.theme.textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              decoration:
                  state ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
