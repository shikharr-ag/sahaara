import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:developer' as dev;

class SmileyFacePainter extends CustomPainter {
  final double smileFactor;
  final double smileWidth;

  SmileyFacePainter({this.smileFactor = 1.0, this.smileWidth = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.5;

    // Draw closed eyes as smaller arcs
    final eyeStart = Offset(size.width * 0.45, size.height * 0.10);
    final eyeEnd = Offset(size.width * 0.55, size.height * 0.10);

    canvas.drawArc(
      Rect.fromCenter(center: eyeStart, width: 4, height: 5),
      pi / 4,
      pi / 2,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: eyeEnd, width: 4, height: 5),
      pi / 4,
      pi / 2,
      false,
      paint,
    );

    // Draw the smile arc with animated width
    final smileStart = Offset(size.width * 0.50, size.height * 0.16);

    canvas.drawArc(
      Rect.fromCenter(center: smileStart, width: 8 * smileWidth, height: 8),
      pi / 4,
      pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant SmileyFacePainter oldDelegate) {
    return oldDelegate.smileFactor != smileFactor ||
        oldDelegate.smileWidth != smileWidth;
  }
}

class SmileyFaceWidget extends StatelessWidget {
  final double smileFactor;
  final double smileWidth;
  final String part;

  const SmileyFaceWidget(
      {super.key,
      this.smileFactor = 1.0,
      this.smileWidth = 1.0,
      this.part = ''});

  @override
  Widget build(BuildContext context) {
    dev.log(smileWidth.toString(), name: part);
    return CustomPaint(
      painter:
          SmileyFacePainter(smileFactor: smileFactor, smileWidth: smileWidth),
    );
  }
}
