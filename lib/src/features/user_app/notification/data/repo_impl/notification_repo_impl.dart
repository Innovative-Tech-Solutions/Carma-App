import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/core/utils/base_repo_impl.dart';
import 'package:carma_app/src/features/user_app/notification/data/datasource/notification_datasource.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/get_notification_response.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/if_new_notification_response.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/mark_all_notifications_response.dart';
import 'package:carma_app/src/features/user_app/notification/domain/repository/notification_repo.dart';
import 'package:fpdart/fpdart.dart';

class NotificationRepoImpl extends NotificationRepository
    with RepositoryErrorHandler {
  final NotificationDatasource _notificationDataSource;

  NotificationRepoImpl({required NotificationDatasource notificationDataSource})
      : _notificationDataSource = notificationDataSource;
  @override
  Future<Either<Failure, MarkNewNotificationsResponse>>
      deleteAllNotification() async {
    return callAction(() => _notificationDataSource.deleteAllNotification());
  }

  @override
  Future<Either<Failure, MarkNewNotificationsResponse>>
      deleteNotification() async {
    return callAction(() => _notificationDataSource.deleteNotification());
  }

  @override
  Future<Either<Failure, GetNotificationResponse>>
      getUserNotifications() async {
    return callAction(() => _notificationDataSource.getUserNotifications());
  }

  @override
  Future<Either<Failure, IfNewNotificationResponse>> ifNewNotification() async {
    return callAction(() => _notificationDataSource.ifNewNotification());
  }

  @override
  Future<Either<Failure, MarkNewNotificationsResponse>>
      markAllNotificationsAsRead() async {
    return callAction(
        () => _notificationDataSource.markAllNotificationsAsRead());
  }

  @override
  Future<Either<Failure, MarkNewNotificationsResponse>>
      markNotificationAsRead() async {
    return callAction(
        () => _notificationDataSource.markAllNotificationsAsRead());
  }
}
