import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  /// Returns the date in 'MMM d' format, e.g., 'Jun 30'.
  String toShortDate() {
    const months = [
      '', // Placeholder to make months[1] = January
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    String month = months[this.month];
    return '$month ${this.day}';
  }

  String toLongDate() {
    return DateFormat('d/M/y').format(this);
  }
  String toDayAndDate() {
    return DateFormat('EEE,d/M/y').format(this);
  }

  String toDateKey() {
    return toIso8601String().split('T')[0];
  }
}

extension CompareDates on DateTime {
  bool isSameDateAs(DateTime other) {
    DateTime otherLocal = other.toLocal();
    DateTime thisLocal = toLocal();
    return thisLocal.day == otherLocal.day &&
        thisLocal.month == otherLocal.month &&
        thisLocal.year == otherLocal.year;
  }

  ///ignores conversion to local
  bool isSameDateAsAbsolute(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }
}
extension DateTimeX on DateTime {
  // Convert UTC time to local time and format in 24-hour format (HH:mm)
  String toLocal24HourFormat() {
    // Convert UTC time to local time
    final localTime = toLocal();
    
    // Format time in 24-hour format (HH:mm)
    final formattedTime = "${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}";
    
    return formattedTime;
  }
}
