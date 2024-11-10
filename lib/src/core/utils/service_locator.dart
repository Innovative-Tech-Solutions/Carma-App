import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/socket_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/session_manager.dart';
import 'package:carma_app/src/features/user_app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:carma_app/src/features/user_app/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:carma_app/src/features/user_app/garage/data/datasource/garage_datasource.dart';
import 'package:carma_app/src/features/user_app/garage/data/repo_impl/garage_repo_impl.dart';
import 'package:carma_app/src/features/user_app/garage/domain/repository/garage_repository.dart';
import 'package:carma_app/src/features/user_app/notification/data/datasource/notification_datasource.dart';
import 'package:carma_app/src/features/user_app/notification/data/repo_impl/notification_repo_impl.dart';
import 'package:carma_app/src/features/user_app/notification/domain/repository/notification_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SessionManager());
  locator.registerLazySingleton(() => UserService(locator<SessionManager>()));
  locator.registerLazySingleton(
      () => DioService(sessionManager: locator<SessionManager>()));
  locator.registerLazySingleton(() => SocketService());

  locator.registerLazySingleton<AuthRemoteDataSource>(() =>
      AuthRemoteDataSourceImpl(
          dioService: locator<DioService>(),
          userService: locator<UserService>()));

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(authDataSource: locator<AuthRemoteDataSource>()),
  );

  locator.registerLazySingleton<NotificationDatasource>(() =>
      NotificationDataSourceImpl(
          dioService: locator<DioService>(),
          userService: locator<UserService>()));

  locator.registerLazySingleton<NotificationRepository>(() =>
      NotificationRepoImpl(
          notificationDataSource: locator<NotificationDatasource>()));

  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton<GarageDatasource>(() => GarageDataSourceImpl(
      dioService: locator<DioService>(), userService: locator<UserService>()));

  locator.registerLazySingleton<GarageRepository>(
      () => GarageRepoImpl(garageDatasource: locator<GarageDatasource>()));
}
