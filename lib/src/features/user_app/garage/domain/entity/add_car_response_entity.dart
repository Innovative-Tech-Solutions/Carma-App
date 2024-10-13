import 'package:carma_app/src/features/user_app/garage/domain/entity/garage_entity.dart';

class AddCarResponseEntity {
  final bool success;
  final Garage? garage;
  final String? message;

  AddCarResponseEntity({required this.success, this.garage, this.message});

  factory AddCarResponseEntity.fromJson(Map<String, dynamic> json) {
    return AddCarResponseEntity(
      success: json['success'],
      garage: json['garage'] != null ? Garage.fromJson(json['garage']) : null,
      message: json['message'], // Nullable message
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
