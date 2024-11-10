import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/notification/data/models/notification_data.dart';
import 'package:carma_app/src/features/user_app/notification/domain/repository/notification_repo.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../data/models/get_notification_response.dart';

class NotificationsViewModel extends EnhancedBaseViewModel {
  NotificationRepository _notificationRepository;
  NavigationService _navigationService;

  List<NotificationData> _notifications = [];
  List<NotificationData> get notifications => _notifications;

  NotificationsViewModel(
      {required NotificationRepository notificationRepository,
      required NavigationService navigationService})
      : _notificationRepository = notificationRepository,
        _navigationService = navigationService;

  goBack() => _navigationService.back();

  Future getUserNotifications() async {
    final GetNotificationResponse? result =
        await runEitherFuture(_notificationRepository.getUserNotifications());

    AppLogger.log("getUserNotifications: $result");

    if (result == null) {
      Toast.showErrorToast(
          message: errorMessage ?? "Error while getting your notifications");
    } else if (!result.success) {
      Toast.showErrorToast(message: result.message!);
    } else {
      _notifications = result.notifications ?? [];
      notifyListeners();
    }
  }
}
