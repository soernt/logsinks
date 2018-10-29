import 'dart:async';

import 'package:colorize/colorize.dart';
import 'package:logging/logging.dart';

import 'log_sink.dart';

/// Outputs log messages to the console.
class ConsoleLogSink implements LogMessageSink {
  // Properties

  StreamSubscription<LogRecord> _subscription;

  // Methods

  @override
  void attachToLogger(Logger logger) {
    assert(logger != null);

    _subscription = Logger.root.onRecord
        .listen(_logMessage, onDone: _handleOnDone, cancelOnError: true);
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  void _handleOnDone() {
    _subscription = null;
  }

  void _logMessage(LogRecord event) {
    Object logLevelText;

    if (event.level == Level.FINE ||
        event.level == Level.FINER ||
        event.level == Level.FINEST) {
      logLevelText = Colorize("${event.level.name}")..bgLightGreen();
    } else if (event.level == Level.INFO) {
      logLevelText = Colorize("${event.level.name}")..bgLightBlue();
    } else if (event.level == Level.WARNING) {
      logLevelText = Colorize("${event.level.name}")..bgYellow();
    } else if (event.level == Level.SEVERE || event.level == Level.SHOUT) {
      logLevelText = Colorize("${event.level.name}")..bgLightRed();
    } else {
      logLevelText = Colorize("${event.level.name}")..default_slyle();
    }

    print(
        '[${event.time} - ${event.loggerName} - ${logLevelText.toString()}] ${event.message ?? event.object?.toString() ?? ""}');
  }
}
