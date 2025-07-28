import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

extension AppDateTimeExtension on DateTime {
  /// converts this `dateTime` to `String` to show in UI
  String get dateWithYear {
    final day = int.parse(DateFormat('d').format(toLocal()));
    final suffix = _getDaySuffix(day);
    final converted = DateFormat("d'$suffix' MMM yyyy").format(toLocal());
    return converted;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  /// converts toLocal() `dateTime` to `String` to show in UI
  String get dateWithoutYear {
    // final converted = DateFormat('dd MMM').format(toLocal());
    final day = int.parse(DateFormat('d').format(toLocal()));
    final suffix = _getDaySuffix(day);
    final converted = DateFormat("d'$suffix' MMM").format(toLocal());
    return converted;
  }

  String get dateForDB {
    final converted = DateFormat('yyyy-MM-dd').format(toLocal());
    return converted;
  }

  String get dateForPDF {
    final converted = DateFormat('dd-MM-yyyy').format(toLocal());
    return converted;
  }

  String get dateTime {
    final day = int.parse(DateFormat('d').format(toLocal()));
    final suffix = _getDaySuffix(day);
    final converted = DateFormat("d'$suffix' MMM hh:mm aa").format(toLocal());

    return converted;
  }

  /// calculates age from toLocal() `dateTime`
  int get calculateAge {
    final currentDate = DateTime.now();
    var age = currentDate.year - year;
    final month1 = currentDate.month;
    final month2 = month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      final day1 = currentDate.day;
      final day2 = day;
      if (day2 > day1) {
        age--;
      }
    }
    return age + 1;
  }

  /// converts this `dateTime` to Verbose DateTime Representation
  String get verboseDateTimeRepresentation {
    final now = DateTime.now().toLocal();
    final justNow = now.subtract(const Duration(minutes: 1));
    final localDateTime = toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return 'Just Now';
    }

    final roughTimeString = DateFormat('jm').format(localDateTime);

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }

    final yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday, $roughTimeString';
    }

    if (now.difference(localDateTime).inDays < 4) {
      final weekday = DateFormat('EEEE').format(localDateTime);

      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('d/M/y').format(this)}, $roughTimeString';
  }

  String get verboseTimeOrDate {
    final now = DateTime.now().toLocal();
    final justNow = now.subtract(const Duration(minutes: 1));
    final localDateTime = toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return 'Just Now';
    }

    final roughTimeString = DateFormat('jm').format(localDateTime);

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }

    final yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday';
    }

    if (now.difference(localDateTime).inDays < 4) {
      final weekday = DateFormat('EEEE').format(localDateTime);

      return weekday;
    }

    return DateFormat('dd MMM, yyyy').format(this);
  }

  String get postTime {
    final now = DateTime.now().toLocal();
    final localDateTime = toLocal();
    final difference = now.difference(localDateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h';
    }
    //  else if (difference.inDays == 1) {
    //   return 'Yesterday';
    // }
    else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years}y';
    }
  }

  String get timeAgo {
    final now = DateTime.now().toLocal();
    final localDateTime = toLocal();
    final difference = now.difference(localDateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    }
    //  else if (difference.inDays == 1) {
    //   return 'Yesterday';
    // }
    else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years}y ago';
    }
  }

  /// converts this `dateTime` to Verbose Date Representation
  String get verboseDate {
    final now = DateTime.now().toLocal();
    final localDateTime = toLocal();

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Today';
    }

    final yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday';
    }

    final tomorrow = now.add(const Duration(days: 1));

    if (localDateTime.day == tomorrow.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Tomorrow';
    }

    if (now.difference(localDateTime).inDays < 4 &&
        now.difference(localDateTime).inDays > 0) {
      final weekday = DateFormat('EEEE').format(localDateTime);

      return weekday;
    }

    return DateFormat('dd MMM yyyy').format(localDateTime);
  }

  String get eventVerboseDate {
    final now = DateTime.now().toLocal();
    final localDateTime = toLocal();

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Today';
    }

    final yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday';
    }

    final tomorrow = now.add(const Duration(days: 1));

    if (localDateTime.day == tomorrow.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Tomorrow';
    }

    if (now.difference(localDateTime).inDays < 4 &&
        now.difference(localDateTime).inDays > 0) {
      final weekday = DateFormat('EEEE').format(localDateTime);

      return weekday;
    }

    return DateFormat('dd MMM').format(localDateTime);
  }

  String get timeString {
    return DateFormat('hh:mm aa').format(toLocal());
  }

  static DateTime parseTimeString(
    String timeString, {
    int? year,
    int? month,
    int? day,
  }) {
    final timeComponents = timeString.split(' ');
    final time = timeComponents[0];
    final period = timeComponents[1];
    final hourMinute = time.split(':');
    var hour = int.parse(hourMinute[0]);
    final minute = int.parse(hourMinute[1]);

    // Adjust hour for PM times
    if (period == 'PM' && hour != 12) {
      hour += 12;
    }

    return DateTime(
      year ?? DateTime.now().year,
      month ?? DateTime.now().month,
      day ?? DateTime.now().day,
      hour,
      minute,
    );
  }

  String get greetings {
    /// if morning then return "Good Morning"

    /// if afternoon then return "Good Afternoon"

    /// if evening then return "Good Evening"

    /// if night then return "Good Night"

    final localDateTime = toLocal();

    if (localDateTime.hour >= 6 && localDateTime.hour < 12) {
      return 'Good Morning !!';
    } else if (localDateTime.hour >= 12 && localDateTime.hour < 18) {
      return 'Good Afternoon !!';
    } else if (localDateTime.hour >= 18 && localDateTime.hour < 24) {
      return 'Good Evening !!';
    } else {
      return 'Good Night !!';
    }
  }

  /// get month year
  String get monthYear {
    return DateFormat('MMM yyyy').format(this);
  }

  bool isSameDay(DateTime other) {
    final now = toLocal();
    final localOther = other.toLocal();

    return now.year == localOther.year &&
        now.month == localOther.month &&
        now.day == localOther.day;
  }
}

List<String> getDayTimeSlots({String? afterTime}) {
  final timeSlots = <String>[];
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, now.day);
  final end = DateTime(now.year, now.month, now.day, 23, 59);
  const interval = Duration(minutes: 15);

  var loopStart = start;

  if (afterTime != null) {
    try {
      final parsedTime = DateFormat('hh:mm aa').parse(afterTime);
      loopStart = DateTime(
        now.year,
        now.month,
        now.day,
        parsedTime.hour,
        parsedTime.minute,
      );
    } catch (e) {
      throw ArgumentError('Invalid time format. Use "hh:mm aa" format.');
    }
  }

  for (var i = loopStart; i.isBefore(end); i = i.add(interval)) {
    timeSlots.add(DateFormat('hh:mm aa').format(i));
  }

  return timeSlots;
}

enum WeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  String getString(BuildContext context) {
    switch (this) {
      case WeekDay.monday:
        return context.appLocalizations.monday;
      case WeekDay.tuesday:
        return context.appLocalizations.tuesday;
      case WeekDay.wednesday:
        return context.appLocalizations.wednesday;
      case WeekDay.thursday:
        return context.appLocalizations.thursday;
      case WeekDay.friday:
        return context.appLocalizations.friday;
      case WeekDay.saturday:
        return context.appLocalizations.saturday;
      case WeekDay.sunday:
        return context.appLocalizations.sunday;
    }
  }
}
