import 'package:carma_app/src/features/user_app/garage/domain/entity/car_entity.dart';

class DeleteCarResponseEntity {
  final bool success;
  final List<Car>? myCars;
  final String? message;

  DeleteCarResponseEntity({required this.success, this.myCars, this.message});

  factory DeleteCarResponseEntity.fromJson(Map<String, dynamic> json) {
    return DeleteCarResponseEntity(
      success: json['success'],
      myCars: json['myCars'] != null
          ? (json['myCars'] as List)
              .map((carJson) => Car.fromJson(carJson))
              .toList()
          : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'myCars': myCars?.map((car) => car.toJson()).toList(),
      'message': message,
    };
  }
}
