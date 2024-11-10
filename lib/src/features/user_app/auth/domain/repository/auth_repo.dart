import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/activation_response.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/login_params.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/login_result_model.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/logout_response.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';
import 'package:fpdart/fpdart.dart';

import '../entity/auth_result_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginParamsModel loginForm);

  Future<Either<Failure, UserRegistrationEntity>> register(
    SignUpParamsModel signUpParams,
  );

  Future<Either<Failure, ActivationResponse>> activateUser(
      String activationToken, String activationCode);

  Future<Either<Failure, LogOutResponse>> logout();

  Future<Either<Failure, void>> forgotPassword(String email);
}
