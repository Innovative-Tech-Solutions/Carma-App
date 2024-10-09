class ForgotPasswordResponse {
  final bool success;
  final String message;
  final String resetToken;

  ForgotPasswordResponse({
    required this.success,
    required this.message,
    required this.resetToken,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      success: json['success'],
      message: json['message'],
      resetToken: json['resetToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'resetToken': resetToken,
    };
  }
}
