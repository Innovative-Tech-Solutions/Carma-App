import 'package:carma_app/src/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:stacked/stacked.dart';

class EnhancedBaseViewModel extends BaseViewModel {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<T?> runEitherFuture<T>(
    Future<Either<Failure, T>> future, {
    bool throwException = false,
  }) async {
    setBusy(true);
    setErrorMessage(null);

    try {
      final result = await future;

      return result.fold(
        (failure) {
          setErrorMessage(failure.message);
          if (throwException) throw failure;
          return null;
        },
        (success) => success,
      );
    } finally {
      setBusy(false);
    }
  }
}
