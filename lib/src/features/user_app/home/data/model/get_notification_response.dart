import 'package:carma_app/src/features/user_app/home/data/model/notification_data.dart';

class GetNotificationResponse {
  final bool success;
  final List<NotificationData> notifications;

  GetNotificationResponse({
    required this.success,
    required this.notifications,
  });

  factory GetNotificationResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationResponse(
      success: json['success'],
      notifications: (json['noifications'] as List)
          .map((data) => NotificationData.fromJson(data))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'noifications': notifications.map((n) => n.toJson()).toList(),
    };
  }
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
