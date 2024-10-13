import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/get_notification_response.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/if_new_notification_response.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/mark_all_notifications_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class NotificationRepository {
  Future<Either<Failure, GetNotificationResponse>> getUserNotifications();

  Future<Either<Failure, MarkNewNotificationsResponse>>
      markNotificationAsRead();

  Future<Either<Failure, IfNewNotificationResponse>> ifNewNotification();

  Future<Either<Failure, MarkNewNotificationsResponse>>
      markAllNotificationsAsRead();

  Future<Either<Failure, MarkNewNotificationsResponse>> deleteNotification();

  Future<Either<Failure, MarkNewNotificationsResponse>> deleteAllNotification();
}
