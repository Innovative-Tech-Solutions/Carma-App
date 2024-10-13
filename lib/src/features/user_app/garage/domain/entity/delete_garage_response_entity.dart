class DeleteGarageResponseEntity {
  final bool success;
  final String message;

  DeleteGarageResponseEntity({required this.success, required this.message});

  factory DeleteGarageResponseEntity.fromJson(Map<String, dynamic> json) {
    return DeleteGarageResponseEntity(
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
