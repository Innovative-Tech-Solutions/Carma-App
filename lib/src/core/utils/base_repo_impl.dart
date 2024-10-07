import 'dart:async';
import 'dart:io';

import 'package:carma_app/src/core/errors/base_failures.dart';
import 'package:carma_app/src/core/errors/error_text.dart';
import 'package:carma_app/src/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

import 'logger.dart';

mixin RepositoryErrorHandler {
  FutureOr<Either<Failure, T>> callAction<T>(
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Right(result);
    } on SocketException {
      return const Left(SocketFailures(message: ErrorText.noInternet));
    } on TimeoutException {
      return const Left(BaseFailures(message: ErrorText.timeOutError));
    } catch (e, s) {
      AppLogger.log('$e $s', tag: 'CATCH CALL ACTION');
      if (e is BaseFailures) {
        return Left(BaseFailures(message: e.message));
      }

      return Left(BaseFailures(message: e.toString()));
    }
  }
}
