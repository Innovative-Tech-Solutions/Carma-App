import 'dart:convert';

class IfNewNotificationResponse {
  bool success;
  String? message;
  List<Mechanic>? mechanics;

  IfNewNotificationResponse({
    required this.success,
    this.message,
    this.mechanics,
  });

  factory IfNewNotificationResponse.fromJson(Map<String, dynamic> json) {
    return IfNewNotificationResponse(
      success: json['success'],
      message: json['message'],
      mechanics: json['mechanics'] != null
          ? List<Mechanic>.from(
              json['mechanics'].map((x) => Mechanic.fromJson(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message ?? '',
      'mechanics': mechanics?.map((item) => item.toJson()).toList(),
    };
  }
}

class Mechanic {
  Location location;
  bool isOnline;
  String id;
  String mechanicName;
  String email;
  String role;
  bool isPhoneVerified;
  List<Service> services;
  String createdAt;
  String updatedAt;
  int v;
  String? address;
  String? firstName;
  String? lastName;
  String? middleName;

  Mechanic({
    required this.location,
    required this.isOnline,
    required this.id,
    required this.mechanicName,
    required this.email,
    required this.role,
    required this.isPhoneVerified,
    required this.services,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.address,
    this.firstName,
    this.lastName,
    this.middleName,
  });

  factory Mechanic.fromJson(Map<String, dynamic> json) {
    return Mechanic(
      location: Location.fromJson(json['location']),
      isOnline: json['isOnline'],
      id: json['_id'],
      mechanicName: json['mechanicName'],
      email: json['email'],
      role: json['role'],
      isPhoneVerified: json['isPhoneVerified'],
      services:
          List<Service>.from(json['services'].map((x) => Service.fromJson(x))),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      address: json['address'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'isOnline': isOnline,
      '_id': id,
      'mechanicName': mechanicName,
      'email': email,
      'role': role,
      'isPhoneVerified': isPhoneVerified,
      'services': List<dynamic>.from(services.map((x) => x.toJson())),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'address': address,
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
    };
  }
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates:
          List<double>.from(json['coordinates'].map((x) => x.toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': List<dynamic>.from(coordinates.map((x) => x)),
    };
  }
}

class Service {
  String id;
  String name;
  String productId;
  String priceId;

  Service({
    required this.id,
    required this.name,
    required this.productId,
    required this.priceId,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'],
      name: json['name'],
      productId: json['productId'],
      priceId: json['priceId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'productId': productId,
      'priceId': priceId,
    };
  }
}
