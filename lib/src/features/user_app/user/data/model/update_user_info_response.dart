import 'package:carma_app/src/core/model/user_data.dart';

class UpdateInfoResponse {
  final bool success;
  final UserData? user;
  final String? message;

  UpdateInfoResponse({
    required this.success,
    this.user,
    this.message,
  });

  factory UpdateInfoResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInfoResponse(
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
