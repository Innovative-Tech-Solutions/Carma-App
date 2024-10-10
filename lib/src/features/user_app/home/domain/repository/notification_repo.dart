import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/features/user_app/home/data/model/get_notification_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class NotificationRepository {
  Future<Either<Failure, GetNotificationResponse>> getUserNotifications();

  Future<Either<Failure, bool>> markNotificationAsRead();

  Future<Either<Failure, bool>> ifNewNotification();

  Future<Either<Failure, bool>> markAllNotificationsAsRead();

  Future<Either<Failure, bool>> deleteNotification();

  Future<Either<Failure, bool>> deleteAllNotification();
}
