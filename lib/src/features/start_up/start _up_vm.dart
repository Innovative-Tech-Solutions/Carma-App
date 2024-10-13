import 'package:carma_app/src/app/app_setup.router.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/session_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final SessionManager _sessionManager;
  final UserService _userService;

  StartUpViewModel(
      {required NavigationService navigationService,
      required SessionManager sessionManager,
      required UserService userService})
      : _navigationService = navigationService,
        _sessionManager = sessionManager,
        _userService = userService;

  Future<void> handleStartupLogic() async {
    final isLoggedIn = _sessionManager.getBool(loginKey) ?? false;
    AppLogger.log("User logged in: $isLoggedIn", tag: "StartUpViewModel");

    await Future.delayed(const Duration(seconds: 1));
    AppLogger.log("User data from Local storage: ${_userService.currentUser}",
        tag: "StartUpViewModel");

    if (isLoggedIn) {
      AppLogger.log("Navigation to Home", tag: "StartUpViewModel");
      _navigationService.replaceWith(Routes.chatRoomsView);
    } else {
      AppLogger.log("Navigation to Login", tag: "StartUpViewModel");

      _navigationService.replaceWith(Routes.loginPage);
    }
  }
}
