class Car {
  final String name;
  final String year;
  final String model;
  final String id;

  Car({
    required this.name,
    required this.year,
    required this.model,
    required this.id,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'],
      year: json['year'],
      model: json['model'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'year': year,
      'model': model,
      '_id': id,
    };
  }
}
