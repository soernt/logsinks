// Import the packages.
import 'package:logging/logging.dart';
import 'package:logsinks/console_log_sink.dart';

void main() {
  // Configer the logger
  Logger.root.level = Level.INFO;

  // Configer a log sink to output the logger messages to the console.
  final messageSink = ConsoleLogSink();
  messageSink.attachToLogger(Logger.root);

  // Create a named logger ...
  final logger = Logger("myLogger");
  // and print "Hello World" at Level.INFO in to the console.
  logger.log(Level.INFO, "Hello World");
  // same as:
  logger.info("Hello World");

  // When you are done, dispose the sink.
  messageSink.dispose();
}