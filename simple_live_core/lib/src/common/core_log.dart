import 'package:logger/logger.dart';

enum RequestLogType {
  /// 输出所有请求信息
  /// 包括请求的URL，请求的参数，请求的头，请求的体，响应的头，响应的内容，耗时
  all,

  /// 简洁的输出
  /// 仅输出请求的URL和响应的状态码
  short,

  /// 不输出请求信息
  none,
}

class CoreLog {
  /// 是否启用日志
  static bool enableLog = true;

  /// 请求日志模式
  static RequestLogType requestLogType = RequestLogType.all;

  static Function(Level, String)? onPrintLog;
  static Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.none,
      // printTime: false,
    ),
  );

  static void d(String message) {
    if (!enableLog) {
      return;
    }

    if (onPrintLog == null) {
      logger.d("${DateTime.now().toString()}\n$message");
    } else {
      onPrintLog!(Level.debug, message);
    }
  }

  static void i(String message) {
    if (!enableLog) {
      return;
    }

    if (onPrintLog == null) {
      logger.i("${DateTime.now().toString()}\n$message");
    } else {
      onPrintLog!(Level.info, message);
    }
  }

  static void e(String message, StackTrace stackTrace) {
    if (!enableLog) {
      return;
    }

    if (onPrintLog == null) {
      logger.e("${DateTime.now().toString()}\n$message",
          stackTrace: stackTrace);
    } else {
      onPrintLog!(Level.error, message);
    }
  }

  static void error(e) {
    if (!enableLog) {
      return;
    }

    if (onPrintLog == null) {
      logger.e(
        "${DateTime.now().toString()}\n${e.toString()}",
        error: e,
        stackTrace: (e is Error) ? e.stackTrace : StackTrace.current,
      );
    } else {
      onPrintLog!(Level.error, e.toString());
    }
  }

  static void w(String message) {
    if (!enableLog) {
      return;
    }

    if (onPrintLog == null) {
      logger.w("${DateTime.now().toString()}\n$message");
    } else {
      onPrintLog!(Level.warning, message);
    }
  }
}
