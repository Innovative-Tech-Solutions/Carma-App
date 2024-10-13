class DeleteCarParams {
  final String carId;
  final String garageId;

  DeleteCarParams({
    required this.carId,
    required this.garageId,
  });

  factory DeleteCarParams.fromJson(Map<String, dynamic> json) {
    return DeleteCarParams(
      carId: json['car_id'],
      garageId: json['garage_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'car_id': carId,
      'garage_id': garageId,
    };
  }
}
