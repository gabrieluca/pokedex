import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  final Logger _logger;
  static final _singleton = Log._();

  factory Log() {
    return _singleton;
  }

  Log._()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 0,
            errorMethodCount: 3,
            lineLength: 50,
            // colors: true,
            // printEmojis: true,
            // printTime: false,
          ),
          // filter: OnlyErrorFilter(),
          // level: Level.error,
        );

  Future<void> error(
    Object object, {
    StackTrace? stack,
    dynamic reason,
    // bool isFatal = false, //For Crashlytics
  }) async {
    if (kDebugMode) {
      _logger.e(object, reason, stack);
      return;
    }
    //HACK Record error in Crashlytics
    // await _crashlytics.recordError(object,{StackTrace stack, printDetails:true,faltal:isFatal});
  }

  Future<void> warning(
    Object object, {
    StackTrace? stack,
    dynamic reason,
  }) async {
    if (kDebugMode) {
      _logger.w(object, reason, stack);
      return;
    }
    //HACK Record error in Crashlytics
  }

  Future<void> info(
    Object object, {
    StackTrace? stack,
    dynamic reason,
  }) async {
    if (kDebugMode) {
      _logger.i(object, reason, stack);
      return;
    }
    //HACK Record error in Crashlytics
  }

  Future<void> debug(
    Object object, {
    StackTrace? stack,
    dynamic reason,
  }) async {
    if (!kDebugMode) return;
    _logger.d(object, reason, stack);
  }
}

class OnlyErrorFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level == Level.error) {
      return true;
    }
    return false;
  }
}

// class SimpleLogPrinter extends LogPrinter {
//   final String className;
//   SimpleLogPrinter(this.className);

//   @override
//   List<String> log(LogEvent event) {
//     // void log(List<String> Function(LogEvent)) {
//     var color = PrettyPrinter.levelColors[event];
//     var emoji = PrettyPrinter.levelEmojis[event];
//     print(color('$emoji $className - $message'));
//   }
// }
