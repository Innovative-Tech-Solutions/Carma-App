import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/features/user_app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:carma_app/src/features/user_app/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => DioService());

  locator.registerLazySingleton<AuthRemoteDataSource>(() =>
      AuthRemoteDataSourceImpl(
          dioService: locator<DioService>(),
          userService: locator<UserService>()));

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(authDataSource: locator<AuthRemoteDataSource>()),
  );
}
