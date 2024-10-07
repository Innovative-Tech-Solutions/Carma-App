import 'package:carma_app/src/core/constants/endpoints.dart';
import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/login_params.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/login_result_model.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/logout_response.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/signup_result_model.dart';
import 'package:carma_app/src/features/user_app/auth/data/model/sign_up_params.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginParamsModel loginForm);

  Future<UserRegistrationResponse> registerUser(SignUpParamsModel signUpForm);

  Future<bool> activateUser(String activationToken, String activationCode);

  Future<void> forgotPassword(String email);

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
  Future<void> forgotPassword(String email) async {}

  @override
  Future<LogOutResponse> logOut() async {
    try {
      final response = await _dioService.get(endpoint: EndPoints.logOut);

      if (response != null) {
        final logOutResponse = LogOutResponse.fromJson(response);
        return logOutResponse;
      }
    } catch (e) {}
    return LogOutResponse(
        success: false, message: "You are not able to sign in");
  }

  @override
  Future<UserRegistrationResponse> registerUser(
      SignUpParamsModel signUpForm) async {
    try {
      final response = await _dioService.post(
          endpoint: EndPoints.register,
          data: {
            "name": "Steven Joseph",
            "email": "user@gmail.com",
            "password": "userpassword"
          });

      if (response != null) {
        final registrationResponse =
            UserRegistrationResponse.fromJson(response);

        if (registrationResponse.success) {
          final userData = UserData(
            name: signUpForm.name,
            email: signUpForm.email,
          );

          final updatedUserData = userData.copyWith(
            activationToken: registrationResponse.activationToken,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          _userService.setCurrentUser(updatedUserData);
        }
        return registrationResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while registering user $e",
          tag: "AuthRemoteDataSourceImpl");
    }
    return UserRegistrationResponse(
        success: false, message: "Could not register", activationToken: "");
  }

  @override
  Future<LoginResponse> login(LoginParamsModel loginModel) async {
    try {
      final response = await _dioService.post(
          endpoint: EndPoints.login,
          data: {"email": "user@gmail.com", "password": "userpassword"});

      if (response != null) {
        final loginResponse = LoginResponse.fromJson(response);
        final userDetailsFromLogin = loginResponse.user!;

        if (loginResponse.success) {
          final updatedUserData = _userService.currentUser!.copyWith(
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

          _userService.setCurrentUser(updatedUserData);
        }
        return loginResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while loggin in user $e",
          tag: "AuthRemoteDataSourceImpl");
    }
    return LoginResponse(success: false, user: null, accessToken: null);
  }

  @override
  Future<bool> activateUser(
      String activationToken, String activationCode) async {
    try {
      final response = await _dioService.post(
          endpoint: EndPoints.activateUser,
          data: {
            "activation_token": activationToken,
            "activation_code": activationCode
          });

      if (response != null) {
        return true;
      }
    } catch (e) {
      AppLogger.logError("Error while loggin in user $e",
          tag: "AuthRemoteDataSourceImpl");
    }
    return false;
  }

  // Future<void> _saveUser({
  //   required User user,
  //   SignUpParamsModel? params,
  //   bool isEmailAuth = true,
  // }) async {
  //   _firebaseHelper.userCollectionRef().doc(user.uid).set({
  //     'user_id': user.uid,
  //     'email': user.email,
  //     'fullname': params?.fullName ?? user.displayName,
  //     'createdAt': _firebaseHelper.timestamp,
  //     'auth_type': isEmailAuth,
  //   });
  // }

  // @override
  // Future<AuthResultModel> signInWithGoogle() async {
  //   final GoogleSignInAccount? user = await _googleSignIn.signIn();

  //   if (user == null) {
  //     throw const NoGoogleAccountChosenException();
  //   }
  //   final GoogleSignInAuthentication googleAuth = await user.authentication;

  //   final OAuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   final UserCredential userDetailsResponse =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   await _saveUser(
  //     user: userDetailsResponse.user!,
  //     isEmailAuth: false,
  //   );

  //   return const AuthResultModel(
  //     message: 'Google sign in successful!',
  //     success: true,
  //   );
  // }
}
