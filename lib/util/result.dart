sealed class Result<T> {
  const Result();

  factory Result.ok(T value) => Ok._(value);

  factory Result.error(Exception error) => Error._(error);
}

final class Ok<T> extends Result<T> {
  final T value;

  const Ok._(this.value);
}

final class Error<T> extends Result<T> {
  final Exception error;

  const Error._(this.error);
}
