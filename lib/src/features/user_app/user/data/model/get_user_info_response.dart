import 'package:carma_app/src/core/model/user_data.dart';

class GetUserInfoResponse {
  final bool success;
  final UserData? user;
  final String? message;

  GetUserInfoResponse({
    required this.success,
    this.user,
    this.message,
  });

  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) {
    return GetUserInfoResponse(
      success: json['success'],
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'user': user?.toJson(),
      'message': message,
    };
  }
}
