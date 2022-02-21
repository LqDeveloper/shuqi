import 'package:logger/logger.dart';

class LoggerUtils {
  static final LoggerUtils _instance = LoggerUtils._internal();

  factory LoggerUtils() => _instance;

  late Logger _logger;

  LoggerUtils._internal() {
    _logger = Logger(printer: PrettyPrinter(printTime: true,lineLength: 200,printEmojis: true));
  }

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.v(message, error, stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.d(message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.i(message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.w(message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.e(message, error, stackTrace);
  }
}
