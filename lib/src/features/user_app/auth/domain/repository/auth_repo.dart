import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';
import 'package:fpdart/fpdart.dart';

import '../entity/auth_result_entity.dart';

abstract class AuthRepository {
  // Future<Either<Failure, AuthResultEntity>> login({
  //   required String email,
  //   required String password,
  // });

  Future<Either<Failure, UserRegistrationEntity>> register(
    SignUpParamsModel signUpParams,
  );

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword(String email);
}
