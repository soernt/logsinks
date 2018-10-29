# logsinks

[![pub package](https://img.shields.io/pub/v/logsinks.svg)](https://pub.dartlang.org/packages/logsinks)

Provides output targets (sinks) for log messages create by the dart [logging](https://pub.dartlang.org/packages/logging) package.

Currently supported sinks:

* ConsoleLogSink: Writes the logger messages to the console. Different log levels are printed in different colors.
  

## Getting Started

Add `logsinks` and `logging` to your `pubspec.yaml` dependencies:
```yaml
...
dependencies:
  flutter:
    sdk: flutter

  logsinks: <current version>
  logging: <current version>
...
```


## Usage
```dart
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

```
