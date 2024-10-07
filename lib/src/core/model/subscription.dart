class Subscription {
  final String productId;
  final String priceId;

  Subscription({
    required this.productId,
    required this.priceId,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      productId: json['productId'],
      priceId: json['priceId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'priceId': priceId,
    };
  }
}
