import 'package:carma_app/src/core/model/user_data.dart';

class LoginResponse {
  final bool success;
  final UserData user;
  final String accessToken;

  LoginResponse({
    required this.success,
    required this.user,
    required this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      user: UserData.fromJson(json['user']),
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'user': user.toJson(),
      'accessToken': accessToken,
    };
  }
}
