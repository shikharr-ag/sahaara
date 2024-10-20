import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sahaara/global/sahaara_theme.dart';
import 'package:sizer/sizer.dart';

// Extension method for Offset normalization
extension OffsetX on Offset {
  Offset normalize() {
    final magnitude = distance;
    if (magnitude == 0) return Offset.zero;
    return this / magnitude;
  }
}

class BlurryBlobs extends StatefulWidget {
  const BlurryBlobs({super.key});

  @override
  State<BlurryBlobs> createState() => _BlurryBlobsState();
}

class _BlurryBlobsState extends State<BlurryBlobs>
    with TickerProviderStateMixin {
  late List<BlobData> blobs;
  late List<AnimationController> controllers;
  final random = Random();

  // Helper method to generate normalized random direction
  Offset getRandomDirection() {
    final double angle = random.nextDouble() * 2 * pi;
    return Offset(cos(angle), sin(angle));
  }

  @override
  void initState() {
    super.initState();

    // Initialize blob data with initial positions and directions
    blobs = [
      BlobData(
        size: 32.h,
        color: AppColors.accentLight,
        speed: 1.5,
        position: Offset(100, 150), // Initial position
        direction: getRandomDirection(),
      ),
      BlobData(
        size: 40.h,
        color: AppColors.primaryLight,
        speed: 1.0,
        position: Offset(200, 250),
        direction: getRandomDirection(),
      ),
      BlobData(
        size: 18.h,
        color: AppColors.secondaryLight,
        speed: 2.0,
        position: Offset(50, 100),
        direction: getRandomDirection(),
      ),
    ];

    // Create animation controllers
    controllers = blobs.map((blob) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 16), // ~60 FPS
      )..addListener(() => updateBlobPosition(blob));
    }).toList();

    // Start animations
    for (var controller in controllers) {
      controller.repeat();
    }
  }

  void updateBlobPosition(BlobData blob) {
    if (!mounted) return;

    final size = MediaQuery.of(context).size;
    final newPosition = blob.position + (blob.direction * blob.speed);

    // Check for horizontal bounds
    if (newPosition.dx < 0 || newPosition.dx > size.width - blob.size) {
      // Reflect direction and add randomness
      final angle = random.nextDouble() * pi / 6 - pi / 12; // ±15 degrees
      final currentAngle = atan2(blob.direction.dy, -blob.direction.dx);
      final newAngle = currentAngle + angle;
      blob.direction = Offset(cos(newAngle), sin(newAngle));
    }

    // Check for vertical bounds
    if (newPosition.dy < 0 || newPosition.dy > size.height - blob.size) {
      // Reflect direction and add randomness
      final angle = random.nextDouble() * pi / 6 - pi / 12; // ±15 degrees
      final currentAngle = atan2(-blob.direction.dy, blob.direction.dx);
      final newAngle = currentAngle + angle;
      blob.direction = Offset(cos(newAngle), sin(newAngle));
    }

    // Update position
    blob.position = Offset(
      newPosition.dx.clamp(0, size.width - blob.size),
      newPosition.dy.clamp(0, size.height - blob.size),
    );
    setState(() {});
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: Stack(
        children: [
          // Blobs rendering
          ...blobs.map((blob) => Positioned(
              left: blob.position.dx,
              top: blob.position.dy,
              child: Container(
                height: blob.size,
                width: blob.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blob.color,
                  boxShadow: [
                    BoxShadow(
                      color: blob.color.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              )
                  .animate(onComplete: (ctrl) => ctrl.repeat())
                  .scale(
                    // Use scaleXY with Offset for x and y scaling
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    begin: const Offset(0.9, 0.9),
                    end: const Offset(1.1, 1.1),
                  )
                  .then()
                  .scale(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    begin: const Offset(1.1, 1.1),
                    end: const Offset(0.9, 0.9),
                  ))),
          // Blurred background using BackdropFilter
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}

class BlobData {
  final double size;
  final Color color;
  final double speed;
  Offset position;
  Offset direction;

  BlobData({
    required this.size,
    required this.color,
    required this.speed,
    required this.position,
    required this.direction,
  });
}
