import 'package:flutter/widgets.dart';

import 'result.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);

abstract class Command<T> extends ChangeNotifier {
  Command();

  bool get running => _running;
  bool _running = false;

  Result<T>? get result => _result;
  Result<T>? _result;

  bool get error => _result is Error;

  bool get completed => _result is Ok;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(Future<Result<T>> Function() action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends Command<T> {
  Command0(this.action);

  final CommandAction0<T> action;

  Future<void> execute() => _execute(action);
}

class Command1<T, A> extends Command<T> {
  Command1(this.action);

  final CommandAction1<T, A> action;

  Future<void> execute(A arg) => _execute(() => action(arg));
}
