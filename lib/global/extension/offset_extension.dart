// Extension method for Offset normalization
import 'dart:ui';

extension OffsetX on Offset {
  Offset normalize() {
    final magnitude = distance;
    if (magnitude == 0) return Offset.zero;
    return this / magnitude;
  }
}
