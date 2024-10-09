// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carma_app/src/core/model/user_data.dart';

class LoginResponse {
  final bool success;
  final String? message;
  final UserData? user;
  final String? accessToken;

  LoginResponse({
    required this.success,
    this.user,
    this.accessToken,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      user: UserData.fromJson(json['user']),
      accessToken: json['accessToken'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'user': user?.toJson(),
      'accessToken': accessToken,
      'message': message
    };
  }

  @override
  String toString() =>
      'LoginResponse(success: $success,message: $message, user: $user, accessToken: $accessToken)';
}
