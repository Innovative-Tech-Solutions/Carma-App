import 'package:carma_app/src/app/app_setup.router.dart';
import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/core/utils/session_manager.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/login_params.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends EnhancedBaseViewModel {
  final AuthRepository _authRepository;
  final UserService _userService;
  final SessionManager _sessionManager;
  final NavigationService _navigationService;

  LoginViewModel({
    required AuthRepository authRepository,
    required UserService userService,
    required SessionManager sessionManager,
    required NavigationService navigationService,
  })  : _authRepository = authRepository,
        _userService = userService,
        _sessionManager = sessionManager,
        _navigationService = navigationService;

  UserData? get currentUser => _userService.currentUser;

  TextEditingController emailCtr =
      TextEditingController(text: "fizzyonu@gmail.com");
  TextEditingController passwordCtr = TextEditingController(text: "jameshulk");

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  Future login() async {
    // _isLoading = true;
    notifyListeners();

    final LoginParamsModel loginForm =
        LoginParamsModel(password: passwordCtr.text, email: emailCtr.text);

    final result = await runEitherFuture(
      _authRepository.login(loginForm),
    );

    // _isLoading = false;
    notifyListeners();

    if (result == null) {
      Toast.showErrorToast(message: errorMessage ?? "Error while signing up");
    } else if (!result.success) {
      Toast.showErrorToast(message: result.message!);
    } else {
      Toast.showSuccessToast(
          message: "Registration successful! Please enter activation code.");
      _sessionManager.storeBool(loginKey, true);
      _navigationService.clearStackAndShow(Routes.homePage);
    }
  }
}
