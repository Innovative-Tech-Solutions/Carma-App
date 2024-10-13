class MarkNewNotificationsResponse {
  final bool success;
  String? message;
  final List<Mechanic>? mechanics;

  MarkNewNotificationsResponse({
    required this.success,
    this.message,
    this.mechanics,
  });

  factory MarkNewNotificationsResponse.fromJson(Map<String, dynamic> json) {
    return MarkNewNotificationsResponse(
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
      'mechanics': mechanics?.map((mechanic) => mechanic.toJson()).toList(),
    };
  }
}

class Mechanic {
  final Location location;
  final bool isOnline;
  final String id;
  final String mechanicName;
  final String email;
  final String role;
  final bool isPhoneVerified;
  final List<Service> services;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String? address;
  final String? firstName;
  final String? lastName;
  final String? middleName;

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
      isOnline: json['isOnline'] ?? false,
      id: json['_id'],
      mechanicName: json['mechanicName'],
      email: json['email'],
      role: json['role'],
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      services: List<Service>.from(
          json['services'].map((service) => Service.fromJson(service))),
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
      'services': services.map((service) => service.toJson()).toList(),
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
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(
          json['coordinates'].map((coordinate) => coordinate)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}

class Service {
  final String id;
  final String name;
  final String productId;
  final String priceId;

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
