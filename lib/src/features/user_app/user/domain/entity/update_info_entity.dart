import 'package:carma_app/src/core/model/subscription.dart';

class UpdateInfoEntity {
  final String name;
  final Subscription?
      subscription; // Nullable, only included when upgrading the subscription

  UpdateInfoEntity({
    required this.name,
    this.subscription,
  });

  factory UpdateInfoEntity.fromJson(Map<String, dynamic> json) {
    return UpdateInfoEntity(
      name: json['name'],
      subscription: json['subscription'] != null
          ? Subscription.fromJson(json['subscription'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subscription': subscription?.toJson(),
    };
  }
}
