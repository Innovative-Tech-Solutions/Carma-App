// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'subscription.dart';

class UserData {
  String? id;
  final String name;
  final String email;
  final String? password;
  String? role;
  final bool isVerified;
  final bool isOnline;
  final List<dynamic> courses;
  final Subscription? subscription;
  String? activationToken;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserData({
    this.id,
    required this.name,
    required this.email,
    this.password,
    this.activationToken,
    this.role,
    this.isVerified = false,
    this.isOnline = false,
    this.courses = const [],
    this.subscription,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    try {
      return UserData(
        id: json['_id'] as String?,
        name: json['name'] as String? ?? '',
        email: json['email'] as String? ?? '',
        password: json['password'] as String?,
        role: json['role'] as String?,
        activationToken: json['activationToken'] as String?,
        isVerified: json['isVerified'] as bool? ?? false,
        isOnline: json['isOnline'] as bool? ?? false,
        courses: json['courses'] != null
            ? List<dynamic>.from(json['courses'] as List)
            : [],
        subscription: json['subscription'] != null
            ? Subscription.fromJson(
                json['subscription'] as Map<String, dynamic>)
            : null,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'] as String)
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'] as String)
            : null,
      );
    } catch (e) {
      return UserData(
        name: '',
        email: '',
      );
    }
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'password': password,
        'role': role,
        'isVerified': isVerified,
        'isOnline': isOnline,
        'courses': courses,
        'activationToken': activationToken,
        'subscription': subscription?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  UserData copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? activationToken,
    String? role,
    bool? isVerified,
    bool? isOnline,
    List<dynamic>? courses,
    Subscription? subscription,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      isVerified: isVerified ?? this.isVerified,
      activationToken: activationToken ?? this.activationToken,
      isOnline: isOnline ?? this.isOnline,
      courses: courses ?? this.courses,
      subscription: subscription ?? this.subscription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, email: $email, password: $password, role: $role, isVerified: $isVerified, isOnline: $isOnline, courses: $courses, subscription: $subscription, activationToken: $activationToken, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
