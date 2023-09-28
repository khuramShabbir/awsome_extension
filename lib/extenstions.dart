import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension WidgetTapExtension on Widget {
  Widget onTap(void Function() onTapCallback) {
    return GestureDetector(
      onTap: onTapCallback,
      child: this,
    );
  }
}
extension DateTimeAgoExtension on DateTime {
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else {
      return DateFormat.yMMMMd().format(this);
    }
  }
}

