import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownText extends StatelessWidget {
  final String markdownData;
  final bool getPreview;

  const MarkdownText({required this.markdownData,this.getPreview=false});

  @override
  Widget build(BuildContext context) {
    final parsedData = _parseMarkdownWithMood(markdownData);

    return getPreview ? Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: 
        (parsedData['beginning']?['mood'] != null)  ? [
          Text('Beginning Mood: ${parsedData['beginning']!['mood']}'),
          const SizedBox(
            height: 8,
          ),
          RichText(
            text: TextSpan(
              children:
                  parsedData['beginning']?['spans'] as List<TextSpan>? ?? [],
              style: AppColors.theme.textTheme.bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
        ] :[Text('Preview Unavailable')],
    ) : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (parsedData['beginning']?['mood'] != null) ...[
          Text('Beginning Mood: ${parsedData['beginning']!['mood']}'),
          const SizedBox(
            height: 8,
          ),
          RichText(
            text: TextSpan(
              children:
                  parsedData['beginning']?['spans'] as List<TextSpan>? ?? [],
              style: AppColors.theme.textTheme.bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
        ],
        if (parsedData['body']?['mood'] != null) ...[
          Text('Mid Conversation Mood: ${parsedData['body']!['mood']}'),
          const SizedBox(
            height: 8,
          ),
          RichText(
            text: TextSpan(
              children: parsedData['body']?['spans'] as List<TextSpan>? ?? [],
              style: AppColors.theme.textTheme.bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
        ],
        if (parsedData['ending']?['mood'] != null) ...[
          Text('Ending Mood: ${parsedData['ending']!['mood']}'),
          const SizedBox(
            height: 8,
          ),
          RichText(
            text: TextSpan(
              children: parsedData['ending']?['spans'] as List<TextSpan>? ?? [],
              style: AppColors.theme.textTheme.bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ],
    );
  }

  Map<String, Map<String, dynamic>> _parseMarkdownWithMood(String text) {
    final parsedData = {
      'beginning': <String, dynamic>{},
      'body': <String, dynamic>{},
      'ending': <String, dynamic>{},
    };

    String currentSection = text;

    // Extract beginning section
    final beginningMatch =
        RegExp(r'<beginning (\w+)\/>(.*?)(?=<body|<ending|$)', dotAll: true)
            .firstMatch(currentSection);
    if (beginningMatch != null) {
      parsedData['beginning'] = {
        'mood': beginningMatch.group(1),
        'spans': _parseMarkdown(beginningMatch.group(2) ?? ''),
      };
      currentSection = currentSection.substring(beginningMatch.end);
    }

    // Extract body section
    final bodyMatch = RegExp(r'<body (\w+)\/>(.*?)(?=<ending|$)', dotAll: true)
        .firstMatch(currentSection);
    if (bodyMatch != null) {
      parsedData['body'] = {
        'mood': bodyMatch.group(1),
        'spans': _parseMarkdown(bodyMatch.group(2) ?? ''),
      };
      currentSection = currentSection.substring(bodyMatch.end);
    }

    // Extract ending section
    final endingMatch = RegExp(r'<ending (\w+)\/>(.*?)$', dotAll: true)
        .firstMatch(currentSection);
    if (endingMatch != null) {
      parsedData['ending'] = {
        'mood': endingMatch.group(1),
        'spans': _parseMarkdown(endingMatch.group(2) ?? ''),
      };
    }

    return parsedData;
  }

  List<TextSpan> _parseMarkdown(String text) {
    final List<TextSpan> spans = [];
    String currentText = text;

    // Process bold text
    final boldPattern = RegExp(r'\*\*(.*?)\*\*');
    currentText = _processPattern(
      currentText,
      boldPattern,
      (match) => TextSpan(
        text: match.group(1),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      spans,
    );

    // Process italic text
    final italicPattern = RegExp(r'_(.*?)_');
    currentText = _processPattern(
      currentText,
      italicPattern,
      (match) => TextSpan(
        text: match.group(1),
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      spans,
    );

    // Process links
    final linkPattern = RegExp(r'\[(.*?)\]\((.*?)\)');
    currentText = _processPattern(
      currentText,
      linkPattern,
      (match) => TextSpan(
        text: match.group(1),
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () => _launchURL(match.group(2)!),
      ),
      spans,
    );

    // Process line breaks
    final lineBreakPattern = RegExp(r'\{n\}');
    currentText = _processPattern(
      currentText,
      lineBreakPattern,
      (match) => const TextSpan(text: '\n'),
      spans,
    );

    // Process underlined text
    final underlinePattern = RegExp(r'\{ul\}(.*?)\{ul\}');
    currentText = _processPattern(
      currentText,
      underlinePattern,
      (match) => TextSpan(
        text: match.group(1),
        style: const TextStyle(decoration: TextDecoration.underline),
      ),
      spans,
    );

    // Process bold underlined text
    final boldUnderlinePattern = RegExp(r'\{ulb\}(.*?)\{ulb\}');
    currentText = _processPattern(
      currentText,
      boldUnderlinePattern,
      (match) => TextSpan(
        text: match.group(1),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      spans,
    );

    // Add any remaining text
    if (currentText.isNotEmpty) {
      spans.add(TextSpan(text: currentText));
    }

    return spans;
  }

  String _processPattern(
    String text,
    RegExp pattern,
    TextSpan Function(RegExpMatch) createSpan,
    List<TextSpan> spans,
  ) {
    String remainingText = text;
    int lastIndex = 0;

    for (final match in pattern.allMatches(text)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
      }
      spans.add(createSpan(match));
      lastIndex = match.end;
    }

    return lastIndex > 0 ? text.substring(lastIndex) : text;
  }

  void _launchURL(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      log("Failed to launch URL: $e");
    }
  }
}
