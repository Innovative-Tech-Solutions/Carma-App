// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carma_app/src/features/user_app/notification/data/models/get_notification_response.dart';

class NotificationData {
  final RequestData? requestData;
  final String? id;
  final String? accountType;
  final String? target;
  final String? message;
  final String? type;
  final bool? read;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;

  NotificationData({
    this.requestData,
    this.id,
    this.accountType,
    this.target,
    this.message,
    this.type,
    this.read,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      requestData: json['request_data'] != null
          ? RequestData.fromJson(json['request_data'])
          : null,
      id: json['_id'],
      accountType: json['accountType'],
      target: json['target'],
      message: json['message'],
      type: json['type'],
      read: json['read'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_data': requestData?.toJson(),
      '_id': id,
      'accountType': accountType,
      'target': target,
      'message': message,
      'type': type,
      'read': read,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': version,
    };
  }

  @override
  String toString() {
    return 'NotificationData(requestData: $requestData, id: $id, accountType: $accountType, target: $target, message: $message, type: $type, read: $read, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
  }
}
