import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends EnhancedBaseViewModel {
  final AuthRepository _authRepository;
  final UserService _userService;

  SignUpViewModel({
    required AuthRepository authRepository,
    required UserService userService,
  })  : _authRepository = authRepository,
        _userService = userService;

  UserData? get currentUser => _userService.currentUser;

  TextEditingController nameCtr = TextEditingController(text: "James Hulk");
  TextEditingController emailCtr =
      TextEditingController(text: "harmonicsub8@gmail.com");
  TextEditingController passwordCtr = TextEditingController(text: "jameshulk");

  Future<bool> registerUser() async {
    final signUpParams = SignUpParamsModel(
      name: nameCtr.text,
      email: emailCtr.text,
      password: passwordCtr.text,
    );

    final result = await runEitherFuture(
      _authRepository.register(signUpParams),
    );

    return result != null;
  }

  // Future<bool> forgotPassword(String email) async {
  //   final result = await runEitherFuture(
  //     _authRepository.forgotPassword(email),
  //   );

  //   return result != null;
  // }

  // Future<bool> logout() async {
  //   final result = await runEitherFuture(
  //     _authRepository.logout(),
  //   );

  //   if (result != null) {
  //     _userService.setCurrentUser(null);
  //     return true;
  //   }
  //   return false;
  // }
}
