import 'package:logging/logging.dart';

/// Abstraction for a logger messages sink.
abstract class LogMessageSink extends Object {
  /// Start listing to the logger.
  void attachToLogger(Logger logger);

  void dispose() {}
}
