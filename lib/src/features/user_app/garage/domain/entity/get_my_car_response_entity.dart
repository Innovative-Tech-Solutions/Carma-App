import 'package:carma_app/src/features/user_app/garage/domain/entity/car_entity.dart';

class GetMyCarResponseEntity {
  final bool success;
  final List<Car>? myCars;
  final String? message;

  GetMyCarResponseEntity({required this.success, this.myCars, this.message});

  factory GetMyCarResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetMyCarResponseEntity(
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
