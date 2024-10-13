// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carma_app/src/features/user_app/notification/data/models/notification_data.dart';

class GetNotificationResponse {
  final bool success;
  final String? message;
  final List<NotificationData>? notifications;

  GetNotificationResponse({
    required this.success,
    this.message,
    this.notifications,
  });

  factory GetNotificationResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationResponse(
      success: json['success'],
      message: json['message'],
      notifications: json['notifications'] != null
          ? (json['notifications'] as List)
              .map((item) => NotificationData.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'notifications': notifications?.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() =>
      'GetNotificationResponse(success: $success, message: $message, notifications: $notifications)';
}

class RequestData {
  final Service service;
  final Mechanic mechanic;
  final User user;
  final String id;

  RequestData({
    required this.service,
    required this.mechanic,
    required this.user,
    required this.id,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(
      service: Service.fromJson(json['service']),
      mechanic: Mechanic.fromJson(json['mechanic']),
      user: User.fromJson(json['user']),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service': service.toJson(),
      'mechanic': mechanic.toJson(),
      'user': user.toJson(),
      'id': id,
    };
  }
}

class Service {
  final String id;
  final String name;

  Service({
    required this.id,
    required this.name,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Mechanic {
  final String id;
  final String name;

  Mechanic({
    required this.id,
    required this.name,
  });

  factory Mechanic.fromJson(Map<String, dynamic> json) {
    return Mechanic(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class User {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
