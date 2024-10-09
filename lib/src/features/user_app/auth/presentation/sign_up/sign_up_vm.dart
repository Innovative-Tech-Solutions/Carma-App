import 'package:carma_app/src/app/app_setup.router.dart';
import 'package:carma_app/src/core/constants/enums.dart';
import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../domain/entity/auth_result_entity.dart';

class SignUpViewModel extends EnhancedBaseViewModel {
  final AuthRepository _authRepository;
  final UserService _userService;
  final NavigationService _navigationService;
  final DialogService _dialogService;

  SignUpViewModel(
      {required AuthRepository authRepository,
      required UserService userService,
      required NavigationService navigationService,
      required DialogService dialogService})
      : _authRepository = authRepository,
        _userService = userService,
        _navigationService = navigationService,
        _dialogService = dialogService;

  UserData? get currentUser => _userService.currentUser;

  TextEditingController nameCtr = TextEditingController(text: "James Hulk");
  TextEditingController emailCtr =
      TextEditingController(text: "fizzyonu@gmail.com");
  TextEditingController passwordCtr = TextEditingController(text: "jameshulk");
  TextEditingController activationCodeCtr = TextEditingController();

  Future registerUser() async {
    final signUpParams = SignUpParamsModel(
      name: nameCtr.text,
      email: emailCtr.text,
      password: passwordCtr.text,
    );

    final result = await runEitherFuture(
      _authRepository.register(signUpParams),
    );

    if (result == null) {
      Toast.showErrorToast(message: errorMessage ?? "Error while signing up");
    } else if (!result.success) {
      Toast.showErrorToast(message: result.message);
    } else {
      // Registration successful
      Toast.showSuccessToast(
          message: "Registration successful! Please enter activation code.");
      await _showActivationDialog();
    }
  }

  Future<void> _showActivationDialog() async {
    final dialogResponse = await _dialogService.showCustomDialog(
      variant: DialogType.activationCode,
      title: 'Enter Activation Code',
      description: 'Please enter the activation code sent to your email',
      mainButtonTitle: 'Activate',
      data: activationCodeCtr,
    );

    if (dialogResponse?.confirmed ?? false) {
      final activationCode = activationCodeCtr.text;
      final activationToken = _userService.currentUser?.activationToken;

      if (activationToken != null) {
        final activationResult = await runEitherFuture(
          _authRepository.activateUser(activationToken, activationCode),
        );

        if (activationResult!.success) {
          Toast.showSuccessToast(message: "Account activated successfully!");
          _navigationService.clearStackAndShow(Routes.homePage);
        } else {
          Toast.showErrorToast(
              message: "Failed to activate account. Please try again.");
        }
      } else {
        Toast.showErrorToast(
            message: "Activation token not found. Please register again.");
      }
    }
  }
}
