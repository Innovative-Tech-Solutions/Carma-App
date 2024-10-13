// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carma_app/src/features/user_app/notification/data/models/get_notification_response.dart';

class NotificationData {
  final RequestData requestData;
  final String id;
  final String accountType;
  final String target;
  final String message;
  final String type;
  final bool read;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  NotificationData({
    required this.requestData,
    required this.id,
    required this.accountType,
    required this.target,
    required this.message,
    required this.type,
    required this.read,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      requestData: RequestData.fromJson(json['request_data']),
      id: json['_id'],
      accountType: json['accountType'],
      target: json['target'],
      message: json['message'],
      type: json['type'],
      read: json['read'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_data': requestData.toJson(),
      '_id': id,
      'accountType': accountType,
      'target': target,
      'message': message,
      'type': type,
      'read': read,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }

  @override
  String toString() {
    return 'NotificationData(requestData: $requestData, id: $id, accountType: $accountType, target: $target, message: $message, type: $type, read: $read, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
  }
}
