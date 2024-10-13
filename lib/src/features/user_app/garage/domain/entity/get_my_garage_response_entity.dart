import 'package:carma_app/src/features/user_app/garage/domain/entity/garage_entity.dart';

class GetMyGarageResponseEntity {
  final bool success;
  final Garage? garage;
  final String? message;

  GetMyGarageResponseEntity({required this.success, this.garage, this.message});

  factory GetMyGarageResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetMyGarageResponseEntity(
      success: json['success'],
      garage: json['garage'] != null ? Garage.fromJson(json['garage']) : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'garage': garage?.toJson(),
      'message': message,
    };
  }
}
