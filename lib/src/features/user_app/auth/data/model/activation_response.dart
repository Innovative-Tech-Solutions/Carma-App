class ActivationResponse {
  final bool success;
  final String? message;

  ActivationResponse({
    required this.success,
    this.message,
  });

  factory ActivationResponse.fromJson(Map<String, dynamic> json) {
    return ActivationResponse(
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
