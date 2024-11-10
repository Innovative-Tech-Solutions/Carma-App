// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carma_app/src/features/user_app/garage/domain/entity/car_entity.dart';

class Garage {
  final String id;
  final String name;
  final String userId;
  List<Car> myCars;
  final String createdAt;
  final String updatedAt;
  final int v;

  Garage({
    required this.id,
    required this.name,
    required this.userId,
    required this.myCars,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Garage.fromJson(Map<String, dynamic> json) {
    var carsList = json['myCars'] as List;
    List<Car> cars = carsList.map((carJson) => Car.fromJson(carJson)).toList();

    return Garage(
      id: json['_id'],
      name: json['name'],
      userId: json['user_id'],
      myCars: cars,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'user_id': userId,
      'myCars': myCars.map((car) => car.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  @override
  String toString() {
    return 'Garage(id: $id, name: $name, userId: $userId, myCars: $myCars, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }
}
