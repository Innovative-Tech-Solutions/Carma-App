import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/core/utils/base_repo_impl.dart';
import 'package:carma_app/src/features/user_app/home/data/datasource/notification_datasource.dart';
import 'package:carma_app/src/features/user_app/home/data/model/get_notification_response.dart';
import 'package:carma_app/src/features/user_app/home/domain/repository/notification_repo.dart';
import 'package:fpdart/fpdart.dart';

class NotificationRepoImpl extends NotificationRepository
    with RepositoryErrorHandler {
  final NotificationDatasource _notificationDataSource;

  NotificationRepoImpl({required NotificationDatasource notificationDataSource})
      : _notificationDataSource = notificationDataSource;
  @override
  Future<Either<Failure, bool>> deleteAllNotification() {
    // TODO: implement deleteAllNotification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteNotification() {
    // TODO: implement deleteNotification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetNotificationResponse>>
      getUserNotifications() async {
    return callAction(() => _notificationDataSource.getUserNotifications());
  }

  @override
  Future<Either<Failure, bool>> ifNewNotification() {
    // TODO: implement ifNewNotification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> markAllNotificationsAsRead() {
    // TODO: implement markAllNotificationsAsRead
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> markNotificationAsRead() {
    // TODO: implement markNotificationAsRead
    throw UnimplementedError();
  }
}
