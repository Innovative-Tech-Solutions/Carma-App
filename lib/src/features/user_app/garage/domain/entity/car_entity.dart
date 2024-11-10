// ignore_for_file: public_member_api_docs, sort_constructors_first
class Car {
  final String? name;
  final String? year;
  final String? model;
  final String? id;
  final String? imageUrl; // Nullable imageUrl property

  Car({
    this.name,
    this.year,
    this.model,
    this.id,
    this.imageUrl, // Include the imageUrl in the constructor
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'],
      year: json['year'],
      model: json['model'],
      id: json['_id'],
      imageUrl: json['imageUrl'], // Handle imageUrl from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'year': year,
      'model': model,
      '_id': id,
      'imageUrl': imageUrl, // Include imageUrl in toJson method
    };
  }

  @override
  String toString() {
    return 'Car(name: $name, year: $year, model: $model, id: $id, imageUrl: $imageUrl)';
  }
}
