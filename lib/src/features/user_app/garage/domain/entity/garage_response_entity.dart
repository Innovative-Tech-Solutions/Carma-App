import 'package:carma_app/src/features/user_app/garage/domain/entity/garage_entity.dart';

class GarageResponse {
  final bool success;
  final String? message;
  final Garage? garage;

  GarageResponse({
    required this.success,
    this.message,
    this.garage,
  });

  factory GarageResponse.fromJson(Map<String, dynamic> json) {
    return GarageResponse(
      success: json['success'],
      message: json['message'] ?? '',
      garage: json['garage'] != null ? Garage.fromJson(json['garage']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message ?? '',
      'garage': garage?.toJson(),
    };
  }
}
