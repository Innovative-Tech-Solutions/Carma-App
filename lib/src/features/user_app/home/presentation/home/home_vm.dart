import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/notification/domain/repository/notification_repo.dart';

class HomeViewModel extends EnhancedBaseViewModel {
  final NotificationRepository _notificationRepository;
  bool _notificationBadgeStatus = false;

  HomeViewModel({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository {
    getNotifications();
  }

  bool get getNotificationBadgeStatus => _notificationBadgeStatus;

  set setNotificationBadgeStatus(bool status) {
    _notificationBadgeStatus = status;
    notifyListeners();
  }

  Future getNotifications() async {
    final result =
        await runEitherFuture(_notificationRepository.getUserNotifications());

    if (result == null) {
      Toast.showErrorToast(message: errorMessage ?? "Error while signing up");
      AppLogger.logError("Unable to get notifications", tag: "HomeViewModel");
    } else if (!result.success) {
      Toast.showErrorToast(message: result.message!);
    } else {
      setNotificationBadgeStatus = true;
      AppLogger.logSuccess("Successly got notifications", tag: "HomeViewModel");
    }
  }
}
