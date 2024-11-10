import 'package:carma_app/src/app/app_setup.router.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/logout_response.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileScreenViewModel extends EnhancedBaseViewModel {
  final AuthRepository _authRepository;
  final NavigationService _navigationService;
  final UserService _userService;

  ProfileScreenViewModel(
      {required AuthRepository authRepository,
      required NavigationService navigationService,
      required UserService userService})
      : _navigationService = navigationService,
        _authRepository = authRepository,
        _userService = userService;

  String get name => _userService.currentUser?.name ?? "";
  String get email => _userService.currentUser?.email ?? "";

  goBack() => _navigationService.back();

  Future logOut() async {
    final LogOutResponse? result =
        await runEitherFuture(_authRepository.logout());

    if (result == null) {
      Toast.showErrorToast(
          message: errorMessage ?? "Error while logging you out");
    } else if (!result.success) {
      Toast.showErrorToast(message: result.message);
    } else {
      Toast.showSuccessToast(message: "Log out successful");

      _navigationService.clearStackAndShow(Routes.loginPage);
    }
  }
}
