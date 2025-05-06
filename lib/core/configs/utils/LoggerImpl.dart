import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _instance = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 5,
      lineLength: 100,
      colors: true,
      printEmojis: true,
    ),
  );

  static Logger get instance => _instance;
}
