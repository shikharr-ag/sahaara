import 'package:flutter/material.dart';
import 'package:record/record.dart';

class AudibilityIndicator extends StatelessWidget {
  final Stream<Amplitude> amplitudeStream;
  final double backgroundNoiseLevel;
  final double peakAmplitude;
  final bool speechDetected;
  final double silenceMargin;

  const AudibilityIndicator({
    Key? key,
    required this.amplitudeStream,
    required this.backgroundNoiseLevel,
    required this.peakAmplitude,
    required this.speechDetected,
    required this.silenceMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Amplitude>(
      stream: amplitudeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final amplitude = snapshot.data!;

          // Dynamic threshold based on the logic provided
          final double dynamicThreshold = backgroundNoiseLevel +
              (peakAmplitude - backgroundNoiseLevel) * 0.3 +
              silenceMargin;

          String audibilityStatus;
          Color statusColor;

          if (!speechDetected) {
            if (amplitude.current > dynamicThreshold) {
              audibilityStatus = 'You are audible';
              statusColor = Colors.green;
            } else {
              audibilityStatus = 'You are not audible';
              statusColor = Colors.red;
            }
          } else {
            if (amplitude.current > dynamicThreshold) {
              audibilityStatus = 'Speaking...';
              statusColor = Colors.green;
            } else {
              audibilityStatus = 'Silent, waiting...';
              statusColor = Colors.orange;
            }
          }

          return Text(
            audibilityStatus,
            style: TextStyle(
              color: statusColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // While waiting for data
        return const Text(
          'Checking audibility...',
          style: TextStyle(fontSize: 18),
        );
      },
    );
  }
}
