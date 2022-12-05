import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.toCapitalized())
          .join(' ');

  String removeLastCharacter() {
    if (length > 0) {
      return substring(0, length - 1);
    } else {
      return this;
    }
  }

  String removeFirstCharacter() {
    if (length > 0) {
      return substring(1);
    } else {
      return this;
    }
  }

  String separateIfUnderscored() {
    if (!contains('_')) {
      return this;
    } else {
      return split('_').join(' ');
    }
  }

  String toCurrencyFormat({String prefix = '', int decimalDigits = 2}) {
    try {
      return NumberFormat.simpleCurrency(
        name: prefix,
        decimalDigits: decimalDigits,
      ).format(double.parse(this));
    } catch (e) {
      return this;
    }
  }

  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }

  String get toDate {
    final date = DateTime.parse(this);
    final newFormat = DateFormat('yMMMd');
    final updatedDt = newFormat.format(date);
    return updatedDt;
  }

  String get toTime {
    final date = DateTime.parse(this);
    final newFormat = DateFormat('jm');
    final updatedDt = newFormat.format(date);
    return updatedDt;
  }

  String get parseToDate {
    try {
      return DateTime.parse(this)
          .toUtc()
          .toString()
          .replaceAll(RegExp('Z'), ' ');
    } catch (e) {
      return '** *** **';
    }
  }

  Color toColor() {
    final hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}