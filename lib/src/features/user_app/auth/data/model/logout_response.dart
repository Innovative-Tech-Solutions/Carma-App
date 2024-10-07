class LogOutResponse {
  bool success;
  String message;

  LogOutResponse({required this.success, required this.message});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'success': success,
      'message': message,
    };
  }

  factory LogOutResponse.fromJson(Map<String, dynamic> map) {
    return LogOutResponse(
      success: map['success'] as bool,
      message: map['message'] as String,
    );
  }
}
