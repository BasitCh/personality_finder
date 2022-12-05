// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DoubleExtension on num {
  // use for all static height throughout the entire app
  // ignore: unnecessary_cast
  double get flexibleHeight => ScreenUtil().setHeight(this);

  // use for all static width throughout the entire app
  // ignore: unnecessary_cast
  double get flexibleWidth => ScreenUtil().setWidth(this) as double;

  // use for all font size throughout the entire app
  // ignore: unnecessary_cast
  double get flexibleFontSize => ScreenUtil().setSp(this) as double;

  /// Use to add horizontal space
  // ignore: unnecessary_cast
  SizedBox get horizontalSpace => SizedBox(width: flexibleWidth);

  // Use to add vertical space
  SizedBox get verticalSpace => SizedBox(height: flexibleHeight);

  String timeAgo({bool short = false}) {
    final duration = DateTime.now()
        // ignore: avoid_as
        .difference(DateTime.fromMillisecondsSinceEpoch(this as int));
    final dateTime = DateTime.now().subtract(duration);
    final time = short
        ? timeago.format(dateTime, locale: 'en_short')
        : timeago.format(dateTime);
    return time;
  }

  String formatDateWith(int? endDate) {
    if (endDate != null) {
      //

      final start = DateTime.fromMillisecondsSinceEpoch(this as int).toLocal();
      final end = DateTime.fromMillisecondsSinceEpoch(endDate).toLocal();

      if (start.month == end.month) {
        if (start.day == end.day) {
          return DateFormat('MMMM d, y').format(start);
        }
        return DateFormat('MMMM d').format(start) +
            DateFormat('-d, y').format(end);
      } else {
        final date = DateFormat('MMMM d - ').format(start) +
            DateFormat('MMMM d, y').format(start);
        return date;
      }
    }
    return '';
  }
}

extension MyIterable<E> on Iterable<E> {
  Iterable<E> sortedBy(Comparable key(E e)) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));
}

/// Get date as a string for display.
String getFormattedDate(String date) {
  /// Convert into local date format.
  final localDate = DateTime.parse(date).toLocal();

  /// inputFormat - format getting from api or other func.
  /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
  /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
  final inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  final inputDate = inputFormat.parse(localDate.toString());

  /// outputFormat - convert into format you want to show.
  final outputFormat = DateFormat('d MMMM, yyyy', );
  final outputDate = outputFormat.format(inputDate);

  return outputDate.toString();
}
