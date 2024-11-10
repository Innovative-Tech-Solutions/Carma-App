import 'package:carma_app/src/core/constants/endpoints.dart';
import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/get_notification_response.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/if_new_notification_response.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/mark_all_notifications_response.dart';

abstract interface class NotificationDatasource {
  Future<GetNotificationResponse> getUserNotifications();

  Future<MarkNewNotificationsResponse> markNotificationAsRead();

  Future<IfNewNotificationResponse> ifNewNotification();

  Future<MarkNewNotificationsResponse> markAllNotificationsAsRead();

  Future<MarkNewNotificationsResponse> deleteNotification();

  Future<MarkNewNotificationsResponse> deleteAllNotification();
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

      AppLogger.log("Response from getting user notifications: $response",
          tag: "getUserNotifications");

      if (response != null) {
        final getNotificationsResponse =
            GetNotificationResponse.fromJson(response);
        AppLogger.log(
            "GetNotificationResponse.fromJso: $getNotificationsResponse",
            tag: "getUserNotifications");
        return getNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting notifications $e",
          tag: "NotificationDataSourceImpl");
      return GetNotificationResponse(
          success: false, message: e.toString(), notifications: []);
    }
    return GetNotificationResponse(
        success: false,
        message: "Unable to get your notifications",
        notifications: []);
  }

  @override
  Future<MarkNewNotificationsResponse> markNotificationAsRead() async {
    try {
      final response = await _dioService.patch(
          endpoint:
              EndPoints.markNotificationAsRead(_userService.currentUser!.id!));

      AppLogger.log("Response from mark notification: $response",
          tag: "markAllNotificationsAsRead");

      if (response != null) {
        final markNewNotificationsResponse =
            MarkNewNotificationsResponse.fromJson(response);
        return markNewNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting notifications $e",
          tag: "NotificationDataSourceImpl");
      return MarkNewNotificationsResponse(
          success: false, message: e.toString(), mechanics: []);
    }
    return MarkNewNotificationsResponse(
        success: false,
        message: "Unable to get your notifications",
        mechanics: []);
  }

  @override
  Future<IfNewNotificationResponse> ifNewNotification() async {
    try {
      final response = await _dioService.get(
          endpoint: EndPoints.ifNewNotification(_userService.currentUser!.id!));

      AppLogger.log("Response from if user notifications: $response",
          tag: "ifNewNotification");

      if (response != null) {
        final ifNewNotificationsResponse =
            IfNewNotificationResponse.fromJson(response);
        return ifNewNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting notifications $e",
          tag: "NotificationDataSourceImpl");
      return IfNewNotificationResponse(
          success: false, message: e.toString(), mechanics: []);
    }
    return IfNewNotificationResponse(
        success: false,
        message: "Unable to get your notifications",
        mechanics: []);
  }

  @override
  Future<MarkNewNotificationsResponse> markAllNotificationsAsRead() async {
    try {
      final response = await _dioService.patch(
          endpoint: EndPoints.markAllNotificationsAsRead(
              _userService.currentUser!.id!));

      AppLogger.log("Response from mark all notifications: $response",
          tag: "markAllNotificationsAsRead");

      if (response != null) {
        final markNewNotificationsResponse =
            MarkNewNotificationsResponse.fromJson(response);
        return markNewNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting notifications $e",
          tag: "NotificationDataSourceImpl");
      return MarkNewNotificationsResponse(
          success: false, message: e.toString(), mechanics: []);
    }
    return MarkNewNotificationsResponse(
        success: false,
        message: "Unable to get your notifications",
        mechanics: []);
  }

  @override
  Future<MarkNewNotificationsResponse> deleteAllNotification() async {
    try {
      final response = await _dioService.delete(
          endpoint:
              EndPoints.deleteAllNotifications(_userService.currentUser!.id!));

      AppLogger.log("Response from mark all notifications: $response",
          tag: "markAllNotificationsAsRead");

      if (response != null) {
        final markNewNotificationsResponse =
            MarkNewNotificationsResponse.fromJson(response);
        return markNewNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while deleting notifications $e",
          tag: "NotificationDataSourceImpl");
      return MarkNewNotificationsResponse(
          success: false, message: e.toString(), mechanics: []);
    }
    return MarkNewNotificationsResponse(
        success: false,
        message: "Unable to delete your notifications",
        mechanics: []);
  }

  @override
  Future<MarkNewNotificationsResponse> deleteNotification() async {
    try {
      final response = await _dioService.delete(
          endpoint:
              EndPoints.deleteNotification(_userService.currentUser!.id!));

      AppLogger.log("Response from delete notification: $response",
          tag: "deleteNotification");

      if (response != null) {
        final markNewNotificationsResponse =
            MarkNewNotificationsResponse.fromJson(response);
        return markNewNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while deleting notification $e",
          tag: "NotificationDataSourceImpl");
      return MarkNewNotificationsResponse(
          success: false, message: e.toString(), mechanics: []);
    }
    return MarkNewNotificationsResponse(
        success: false,
        message: "Unable to delete your notification",
        mechanics: []);
  }
}
