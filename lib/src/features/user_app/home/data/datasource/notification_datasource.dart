import 'package:carma_app/src/core/constants/endpoints.dart';
import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/home/data/model/get_notification_response.dart';

abstract interface class NotificationDatasource {
  Future<GetNotificationResponse> getUserNotifications();

  Future<bool> markNotificationAsRead();

  Future<bool> ifNewNotification();

  Future<bool> markAllNotificationsAsRead();

  Future<bool> deleteNotification();

  Future<bool> deleteAllNotification();
}

class NotificationDataSourceImpl extends NotificationDatasource {
  final DioService _dioService;
  final UserService _userService;

  NotificationDataSourceImpl({
    required DioService dioService,
    required UserService userService,
  })  : _dioService = dioService,
        _userService = userService;
  @override
  Future<GetNotificationResponse> getUserNotifications() async {
    try {
      final response = await _dioService.get(
          endpoint:
              EndPoints.getUserNotification(_userService.currentUser!.id!));

      if (response != null) {
        final logOutResponse = GetNotificationResponse.fromJson(response);
        return logOutResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting notifications $e",
          tag: "NotificationDataSourceImpl");
    }
    return GetNotificationResponse(success: false, notifications: []);
  }

  @override
  Future<bool> markNotificationAsRead() async {
    try {
      // TODO: Check for referring to specific notification by id
      final response = await _dioService.get(
          endpoint:
              EndPoints.markNotificationAsRead(_userService.currentUser!.id!));

      if (response != null) {
        return true;
      }
    } catch (e) {
      AppLogger.logError("Error while marking notification as read $e",
          tag: "NotificationDataSourceImpl");
    }
    return false;
  }

  @override
  Future<bool> deleteAllNotification() async {
    try {
      final response = await _dioService.get(
          endpoint:
              EndPoints.deleteAllNotifications(_userService.currentUser!.id!));

      if (response != null) {
        return true;
      }
    } catch (e) {
      AppLogger.logError("Error while deleting all notifications $e",
          tag: "NotificationDataSourceImpl");
    }
    return false;
  }

  @override
  Future<bool> deleteNotification() async {
    try {
      // TODO: Check for referring to specific notification by id
      final response = await _dioService.get(
          endpoint:
              EndPoints.deleteNotification(_userService.currentUser!.id!));

      if (response != null) {
        return true;
      }
    } catch (e) {
      AppLogger.logError("Error while deleting notification $e",
          tag: "NotificationDataSourceImpl");
    }
    return false;
  }

  @override
  Future<bool> ifNewNotification() async {
    try {
      final response = await _dioService.get(
          endpoint: EndPoints.ifNewNotification(_userService.currentUser!.id!));

      if (response != null) {
        return true;
      }
    } catch (e) {
      AppLogger.logError("Error while checking if new notification $e",
          tag: "NotificationDataSourceImpl");
    }
    return false;
  }

  @override
  Future<bool> markAllNotificationsAsRead() async {
    try {
      final response = await _dioService.get(
          endpoint: EndPoints.markAllNotificationsAsRead(
              _userService.currentUser!.id!));

      if (response != null) {
        return true;
      }
    } catch (e) {
      AppLogger.logError("Error while checking if new notification $e",
          tag: "NotificationDataSourceImpl");
    }
    return false;
  }
}
