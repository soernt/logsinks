import 'package:logging/logging.dart';

/// Abstraction for a logger messages sink.
abstract class ILogMessageSink {
  /// Start listing to the logger.
  void attachToLogger(Logger logger);

  void dispose() {}
}
