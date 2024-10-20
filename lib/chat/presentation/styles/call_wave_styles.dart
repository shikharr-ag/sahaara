import 'package:flutter/material.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:wave/config.dart';

class WaveConfig {
  static CustomConfig get calmingWaves => CustomConfig(
        gradients: [
          [
            AppColors.primaryLight,
            AppColors.primaryLight.withOpacity(0.4),
          ],
          [
            AppColors.secondary,
            AppColors.secondary.withOpacity(0.5),
          ],
          [
            AppColors.accent,
            AppColors.accent.withOpacity(0.6),
          ],
        ],
        durations: [
          16000, // Slower primary wave for a more calming effect
          24000, // Medium speed for the middle wave
          28000, // Slightly faster than primary but still gentle
        ],
        heightPercentages: [
          0.15, // Main wave
          0.28, // Middle wave
          0.4, // Background wave
        ],
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
        // blur: 0.2,
        // gradientColorStops: [
        //   0.2,
        //   0.8,
        // ],
      );

  // Alternative configuration with different timing
  static CustomConfig get gentleWaves => CustomConfig(
        gradients: [
          [
            AppColors.accentLight,
            AppColors.accentLight.withOpacity(0.4),
          ],
          [
            AppColors.secondaryLight,
            AppColors.secondaryLight.withOpacity(0.5),
          ],
          [
            AppColors.primaryLight,
            AppColors.primaryLight.withOpacity(0.6),
          ],
        ],
        durations: [
          35000, // Very slow wave
          28000, // Medium wave
          30000, // Slow wave
        ],
        heightPercentages: [
          0.30, // Slightly lower main wave
          0.25, // Middle wave
          0.20, // Subtle background wave
        ],
        gradientBegin: Alignment.bottomCenter,
        gradientEnd: Alignment.topCenter,
        // blur: 0.1,
        // gradientColorStops: [
        //   0.3,
        //   0.7,
        // ],
      );
}
