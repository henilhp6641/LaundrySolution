import 'dart:async';

/// typedef for action function for [DeBouncer]
typedef DeBounceAction = void Function();

/// de-bounces [run] method calls and runs it only once in given [milliseconds]
class DeBouncer {
  Timer? _timer;

  /// Allows to create an instance with optional [Duration]
  DeBouncer();

  /// Runs [action] after debounced interval.
  void run(Duration duration, DeBounceAction action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  /// Allows to cancel current timer.
  void cancel() {
    _timer?.cancel();
  }
}
