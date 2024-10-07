import 'error_text.dart';

abstract class Failure {
  const Failure({
    this.message = ErrorText.somethingWentWrong,
    this.trace,
  });

  final String message;
  final StackTrace? trace;
}
