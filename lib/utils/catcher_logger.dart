import 'package:logger/logger.dart' as s;
import 'package:logging/logging.dart';

///Class used to provide logger for Catcher.
class CatcherLogger {
  var _logger = s.Logger(
      printer: s.PrettyPrinter(
    methodCount: 3,
  ));

  ///Setup logger configuration.
  void setup() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(
      (LogRecord rec) {
        // ignore: avoid_print
        print(
          '[${rec.time} | ${rec.loggerName} | ${rec.level.name}] ${rec.message}',
        );
      },
    );
  }

  ///Log info message.
  void info(String message) {
    _logger.i(message);
  }

  ///Log fine message.
  void fine(String message) {
    _logger.v(message);
  }

  ///Log warning message.
  void warning(String message) {
    _logger.w(message);
  }

  ///Log severe mesasge.
  void severe(String message) {
    _logger.wtf(message);
  }
}
