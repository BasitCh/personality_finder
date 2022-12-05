// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:logger/logger.dart';

/// Adopted from Logger's pretty printer to not include the boxes
@visibleForTesting
@immutable
class OurPrettyPrinter extends LogPrinter {
  static final levelColors = {
    Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: AnsiColor.none(),
    Level.info: AnsiColor.fg(12),
    Level.warning: AnsiColor.fg(208),
    Level.error: AnsiColor.fg(196),
    Level.wtf: AnsiColor.fg(199),
  };

  static final levelEmojis = {
    Level.verbose: '',
    Level.debug: '🐛 ',
    Level.info: '💡 ',
    Level.warning: '⚠️ ',
    Level.error: '⛔ ',
    Level.wtf: '👾 ',
  };

  /// Matches a stacktrace line as generated on Android/iOS devices.
  /// For example:
  /// #1      Logger.log (package:logger/src/logger.dart:115:29)
  static final _deviceStackTraceRegex =
      RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  /// The index which to begin the stack trace at
  ///
  /// This can be useful if, for instance, Logger is wrapped in another class and
  /// you wish to remove these wrapped calls from stack trace
  final int stackTraceBeginIndex;
  final int methodCount;
  final int errorMethodCount;
  final int lineLength;
  final bool colors;
  final bool printEmojis;
  final bool printTime;

  OurPrettyPrinter({
    this.stackTraceBeginIndex = 0,
    this.methodCount = 2,
    this.errorMethodCount = 8,
    this.lineLength = 120,
    this.colors = true,
    this.printEmojis = true,
    this.printTime = false,
  });

  @override
  List<String> log(LogEvent event) {
    final messageStr = stringifyMessage(event.message);

    String? stackTraceStr;
    if (event.stackTrace == null) {
      if (methodCount > 0) {
        stackTraceStr = formatStackTrace(StackTrace.current, methodCount);
      }
    } else if (errorMethodCount > 0) {
      stackTraceStr = formatStackTrace(event.stackTrace, errorMethodCount);
    }

    final errorStr = event.error?.toString();

    String? timeStr;
    if (printTime) {
      timeStr = getTime();
    }

    return _formatAndPrint(
      event.level,
      messageStr,
      timeStr,
      errorStr,
      stackTraceStr,
    );
  }

  String? formatStackTrace(StackTrace? stackTrace, int methodCount) {
    var lines = stackTrace.toString().split('\n');
    if (stackTraceBeginIndex > 0 && stackTraceBeginIndex < lines.length - 1) {
      lines = lines.sublist(stackTraceBeginIndex);
    }
    final formatted = <String>[];
    var count = 0;
    for (final line in lines) {
      if (_discardDeviceStacktraceLine(line) || line.isEmpty) {
        continue;
      }
      formatted.add('#$count   ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
      if (++count == methodCount) {
        break;
      }
    }

    if (formatted.isEmpty) {
      return null;
    } else {
      return formatted.join('\n');
    }
  }

  bool _discardDeviceStacktraceLine(String line) {
    final match = _deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(2)!.startsWith('package:logger');
  }

  String getTime() {
    String _threeDigits(int n) => '$n'.padLeft(3, '0');
    String _twoDigits(int n) => '$n'.padLeft(2, '0');

    final now = DateTime.now();
    final h = _twoDigits(now.hour);
    final min = _twoDigits(now.minute);
    final sec = _twoDigits(now.second);
    final ms = _threeDigits(now.millisecond);
    return '$h:$min:$sec.$ms';
  }

  String stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }

  AnsiColor _getLevelColor(Level level) {
    if (colors) {
      return levelColors[level]!;
    } else {
      return AnsiColor.none();
    }
  }

  AnsiColor _getErrorColor(Level level) {
    if (colors) {
      if (level == Level.wtf) {
        return levelColors[Level.wtf]!.toBg();
      } else {
        return levelColors[Level.error]!.toBg();
      }
    } else {
      return AnsiColor.none();
    }
  }

  String _getEmoji(Level level) {
    if (printEmojis) {
      return levelEmojis[level]!;
    } else {
      return '';
    }
  }

  List<String> _formatAndPrint(
    Level level,
    String message,
    String? time,
    String? error,
    String? stacktrace,
  ) {
    // This code is non trivial and a type annotation here helps understanding.
    // ignore: omit_local_variable_types
    final List<String> buffer = [];
    final color = _getLevelColor(level);
    final timeInfix = time != null ? '$time ' : '';

    if (error != null) {
      final errorColor = _getErrorColor(level);
      for (final line in error.split('\n')) {
        buffer.add(
          (time == null ? '' : color(timeInfix)) +
              errorColor.resetForeground +
              errorColor(line) +
              errorColor.resetBackground,
        );
      }
    }

    if (stacktrace != null) {
      for (final line in stacktrace.split('\n')) {
        buffer.add('$color $timeInfix$line');
      }
    }

    final emoji = _getEmoji(level);
    for (final line in message.split('\n')) {
      buffer.add(color(' $timeInfix$emoji$line'));
    }

    return buffer;
  }
}
