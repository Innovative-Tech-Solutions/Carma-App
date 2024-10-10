import 'package:carma_app/src/features/user_app/chat/data/model/participant_data.dart';

class ChatRoom {
  final String id;
  final List<String> participants;
  final List<ParticipantData> participantsData;

  ChatRoom({
    required this.id,
    required this.participants,
    required this.participantsData,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['_id'] as String,
      participants: List<String>.from(json['participants']),
      participantsData: (json['participantsData'] as List)
          .map((data) => ParticipantData.fromJson(data))
          .toList(),
    );
  }
}
