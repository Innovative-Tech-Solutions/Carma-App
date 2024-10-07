import '../../domain/entity/auth_result_entity.dart';

class UserRegistrationResponse extends UserRegistrationEntity {
  UserRegistrationResponse({
    required super.success,
    required super.message,
    required super.activationToken,
  });

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return UserRegistrationResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      activationToken: json['activationToken'] as String,
    );
  }
}
