import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/core/utils/base_repo_impl.dart';
import 'package:carma_app/src/features/user_app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/signup_result_model.dart';
import 'package:carma_app/src/features/user_app/auth/domain/entity/auth_result_entity.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl extends AuthRepository with RepositoryErrorHandler {
  final AuthRemoteDataSource _authDataSource;

  AuthRepoImpl({
    required AuthRemoteDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    return callAction(() => _authDataSource.forgotPassword(email));
  }

  // @override
  // Future<Either<Failure, UserRegistrationResponse>> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   return callAction(() => _authDataSource.login(email, password));
  // }

  @override
  Future<Either<Failure, UserRegistrationEntity>> register(
    SignUpParamsModel signUpParams,
  ) async {
    return callAction(() => _authDataSource.registerUser(signUpParams));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return callAction(() => _authDataSource.logOut());
  }
}
