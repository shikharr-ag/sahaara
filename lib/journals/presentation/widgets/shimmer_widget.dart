import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerContainer extends StatelessWidget {
  final Stream<bool> isLoadingStream;
  final Map<String, dynamic> _item;
  final Color color;
  const ShimmerContainer({
    Key? key,
    required this.isLoadingStream,
    required this.color,
    required Map<String, dynamic> item,
  })  : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: isLoadingStream, // Use the loading stream
        builder: (context, snapshot) {
          final isLoading = snapshot.data ?? true; // Default to true if no data

          // Actual content when not loading
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: isLoading
                    ? [
                        Text(
                          'Generating Journal Entry..',
                          style: AppColors.theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballPulseSync,
                            colors: [
                              AppColors.primaryDark,
                              AppColors.secondaryDark,
                              AppColors.accentDark,
                            ],
                          ),
                        ),
                      ]
                    : [
                        Text(
                          _item['journalTitle'],
                          style: AppColors.theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _item['journalContent'],
                          style: AppColors.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 8,
                        ),
                      ],
              ),
            ),
          );
        });
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class Skeleton extends StatelessWidget {
  const Skeleton(
      {Key? key,
      this.height,
      this.width,
      this.isCircle = false,
      this.roundedRectangle = false})
      : super(key: key);

  final double? height, width;
  final bool isCircle;
  final bool roundedRectangle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle
              ? null
              : roundedRectangle
                  ? BorderRadius.circular(12.0)
                  : BorderRadius.circular(2.3)),
    );
  }
}

class TodayTaskSkeleton extends StatelessWidget {
  const TodayTaskSkeleton({
    Key? key,
  }) : super(key: key);

  static const double defaultPadding = 15;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        size.width / 20.0,
        0,
        size.width / 20.0,
        size.width / 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Skeleton(
                width: 40,
                height: 40,
                isCircle: true,
              ),
              const SizedBox(
                width: 10,
              ),
              Skeleton(
                width: size.width * 0.5,
                height: 12,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Skeleton(
                width: 40,
                height: 40,
                isCircle: true,
              ),
              const SizedBox(
                width: 10,
              ),
              Skeleton(
                width: size.width * 0.5,
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
