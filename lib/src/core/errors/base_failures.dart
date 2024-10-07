import 'failure.dart';

class BaseFailures extends Failure {
  const BaseFailures({
    required super.message,
    super.trace,
  });
  @override
  String toString() {
    return 'Base Failures: $message $trace';
  }
}

class SocketFailures extends Failure {
  const SocketFailures({
    required super.message,
    super.trace,
  });
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.trace,
  });
}

class TokenFailure extends Failure {
  const TokenFailure({
    required super.message,
    super.trace,
  });
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({
    required super.message,
    super.trace,
  });
}
