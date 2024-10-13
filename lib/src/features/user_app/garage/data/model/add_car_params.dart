class AddCarParams {
  final String name;
  final String model;
  final String year;
  final String garageId;

  AddCarParams({
    required this.name,
    required this.model,
    required this.year,
    required this.garageId,
  });

  factory AddCarParams.fromJson(Map<String, dynamic> json) {
    return AddCarParams(
      name: json['name'],
      model: json['model'],
      year: json['year'],
      garageId: json['garage_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
      'year': year,
      'garage_id': garageId,
    };
  }
}
