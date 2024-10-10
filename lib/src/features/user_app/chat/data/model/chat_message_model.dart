class ChatMessage {
  final String uid;
  final String text;
  final DateTime time;
  final String? id;

  ChatMessage({
    required this.uid,
    required this.text,
    required this.time,
    this.id,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      uid: json['uid'] as String,
      text: json['text'] as String,
      time: DateTime.parse(json['time'] as String),
      id: json['_id'] as String?,
    );
  }
}
