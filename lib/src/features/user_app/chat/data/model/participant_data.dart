// ignore_for_file: public_member_api_docs, sort_constructors_first
class ParticipantData {
  final String id;
  final String name;

  ParticipantData({required this.id, required this.name});

  factory ParticipantData.fromJson(Map<String, dynamic> json) {
    return ParticipantData(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  @override
  String toString() => 'ParticipantData(id: $id, name: $name)';
}
