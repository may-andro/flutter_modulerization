part of common;

class AppLogger {
  static void init() {
    Fimber.plantTree(DebugTree.elapsed(useColors: true));
  }

  static FimberLog setLogTag(String tag) {
    return FimberLog(tag);
  }

  static void logDebug(String message, {dynamic ex, StackTrace? stacktrace, FimberLog? logger}) {
    if (logger == null) {
      Fimber.d(message, ex: ex, stacktrace: stacktrace);
      return;
    }
    logger.d(message, ex: ex, stacktrace: stacktrace);
  }

  static void logError(String message, {dynamic ex, StackTrace? stacktrace, FimberLog? logger}) {
    if (logger == null) {
      Fimber.e(message, ex: ex, stacktrace: stacktrace);
      return;
    }
    logger.e(message, ex: ex, stacktrace: stacktrace);
  }

  static void logInfo(String message, {dynamic ex, StackTrace? stacktrace, FimberLog? logger}) {
    if (logger == null) {
      Fimber.i(message, ex: ex, stacktrace: stacktrace);
      return;
    }
    logger.i(message, ex: ex, stacktrace: stacktrace);
  }

  static void logWarning(String message, {dynamic ex, StackTrace? stacktrace, FimberLog? logger}) {
    if (logger == null) {
      Fimber.w(message, ex: ex, stacktrace: stacktrace);
      return;
    }
    logger.w(message, ex: ex, stacktrace: stacktrace);
  }
}
