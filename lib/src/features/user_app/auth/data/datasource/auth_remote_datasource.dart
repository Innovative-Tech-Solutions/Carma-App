import 'package:carma_app/src/core/constants/endpoints.dart';
import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/activation_response.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/forgot_password_response.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/login_params.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/login_result_model.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/logout_response.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/signup_result_model.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginParamsModel loginForm);

  Future<UserRegistrationResponse> registerUser(SignUpParamsModel signUpForm);

  Future<ActivationResponse> activateUser(
      String activationToken, String activationCode);

  Future<ForgotPasswordResponse> forgotPassword(String email);

  Future<bool> verifyForgotPassword(String resetToken);

  Future<bool> updatePassword(String oldPassword, String newPassword);

  Future<bool> saveNewPassword(String newPassword);

  Future<LogOutResponse> logOut();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final DioService _dioService;
  final UserService _userService;

  AuthRemoteDataSourceImpl({
    required DioService dioService,
    required UserService userService,
  })  : _dioService = dioService,
        _userService = userService;

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    try {
      final response =
          await _dioService.get(endpoint: EndPoints.forgotPassword);

      if (response != null) {
        final forgotPasswordResponse =
            ForgotPasswordResponse.fromJson(response);
        return forgotPasswordResponse;
      }
    } catch (e) {}
    return ForgotPasswordResponse(success: false, message: "", resetToken: "");
  }

  @override
  Future<LogOutResponse> logOut() async {
    try {
      final response = await _dioService.get(endpoint: EndPoints.logOut);

      if (response != null) {
        final logOutResponse = LogOutResponse.fromJson(response);
        if (logOutResponse.success) {
          await _userService.clearUserData();
          await _dioService.clearAuthToken();

          AppLogger.log("Log out was successful");
        }
        return logOutResponse;
      }
    } catch (e) {
      return LogOutResponse(success: false, message: e.toString());
    }
    return LogOutResponse(
        success: false, message: "You are not able to sign in");
  }

  @override
  Future<UserRegistrationResponse> registerUser(
      SignUpParamsModel signUpForm) async {
    AppLogger.log("Sign up form: $signUpForm", tag: "registerUser");
    try {
      final response = await _dioService.post(
        endpoint: EndPoints.register,
        data: signUpForm.toJson(),
      );
      AppLogger.log("Response: $response", tag: "registerUser");

      if (response != null) {
        final registrationResponse =
            UserRegistrationResponse.fromJson(response);
        AppLogger.log("UserRegistrationResponse: $registrationResponse",
            tag: "registerUser");

        if (registrationResponse.success) {
          final userData = UserData(
            name: signUpForm.name,
            email: signUpForm.email,
            activationToken: registrationResponse.activationToken,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          await _dioService.setAuthToken(userData.activationToken!);

          await _userService.setCurrentUser(userData);
          AppLogger.log("User after registration: ${_userService.currentUser}",
              tag: "registerUser");
        }
        return registrationResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while registering user $e",
          tag: "AuthRemoteDataSourceImpl");
      return UserRegistrationResponse(
        success: false,
        message: e.toString(),
        activationToken: "",
      );
    }

    return UserRegistrationResponse(
      success: false,
      message: "Unexpected error occurred",
      activationToken: "",
    );
  }

  @override
  Future<LoginResponse> login(LoginParamsModel loginForm) async {
    try {
      final response = await _dioService.post(
          endpoint: EndPoints.login, data: loginForm.toJson());

      if (response != null) {
        final loginResponse = LoginResponse.fromJson(response);
        AppLogger.log("LoginResponse: $loginResponse", tag: "login");

        if (loginResponse.success) {
          final userDetailsFromLogin = loginResponse.user!;
          AppLogger.log("User details from login: $userDetailsFromLogin",
              tag: "login");

          final user = UserData(
            id: userDetailsFromLogin.id,
            name: userDetailsFromLogin.name,
            email: userDetailsFromLogin.email,
            role: userDetailsFromLogin.role,
            isVerified: userDetailsFromLogin.isVerified,
            isOnline: userDetailsFromLogin.isOnline,
            courses: userDetailsFromLogin.courses,
            activationToken: loginResponse.accessToken,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          await _dioService.setAuthToken(user.activationToken!);

          _userService.setCurrentUser(user);
          AppLogger.log("User after login: ${_userService.currentUser}");
        }
        return loginResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while loggin in user $e",
          tag: "AuthRemoteDataSourceImpl");
      return LoginResponse(success: false, message: e.toString());
    }
    return LoginResponse(success: false, user: null, accessToken: null);
  }

  @override
  Future<ActivationResponse> activateUser(
      String activationToken, String activationCode) async {
    try {
      final response = await _dioService.post(
          endpoint: EndPoints.activateUser,
          data: {
            "activation_token": activationToken,
            "activation_code": activationCode
          });

      if (response != null) {
        final activationResponse = ActivationResponse.fromJson(response);

        return activationResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while loggin in user $e",
          tag: "AuthRemoteDataSourceImpl");
    }
    return ActivationResponse(success: false);
  }

  @override
  Future<bool> updatePassword(String oldPassword, String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyForgotPassword(String resetToken) async {
    // TODO: implement updatePassword
    throw UnimplementedError();
    // try {
    //   final response =
    //       await _dioService.get(endpoint: EndPoints.verifyForgotPassword);

    //   if (response != null) {
    //     return true;
    //   }
    // } catch (e) {}
    // return false;
  }

  @override
  Future<bool> saveNewPassword(String newPassword) async {
    // TODO: implement updatePassword
    throw UnimplementedError();
    // try {
    //   final response =
    //       await _dioService.get(endpoint: EndPoints.saveNewPassword);

    //   if (response != null) {
    //     return true;
    //   }
    // } catch (e) {}
    // return false;
  }
}
