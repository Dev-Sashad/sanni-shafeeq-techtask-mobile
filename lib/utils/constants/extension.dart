import 'package:jiffy/jiffy.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension JiffyExtensions on Jiffy {
  /// determines if Jiffy DateTime instance falls on today
  bool get isToday {
    var now = Jiffy();
    return isSame(now, Units.DAY);
  }

  /// determines if Jiffy DateTime instance falls on Yesterday or the previous day
  bool get isYesterday {
    var yesterday = Jiffy().subtract(days: 1);
    return isSame(yesterday, Units.DAY);
  }

  /// determines if Jiffy DateTime instance falls on Tomorrow or the next day
  bool get isTomorrow {
    var tomorrow = Jiffy().add(days: 1);
    return isSame(tomorrow, Units.DAY);
  }

  /// determines if Jiffy DateTime instance falls on the same week as current date
  bool get isThisWeek {
    var now = Jiffy();
    return isSame(now, Units.WEEK);
  }
}
