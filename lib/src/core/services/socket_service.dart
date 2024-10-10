import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/chat/data/model/chat_message_model.dart';
import 'package:carma_app/src/features/user_app/chat/data/model/chat_room_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:injectable/injectable.dart';

@lazySingleton
class SocketService {
  IO.Socket? _socket;
  final String baseUrl = 'https://chatapi.carmagard.com';

  IO.Socket get socket {
    if (_socket == null) {
      throw StateError(
          'Socket has not been initialized. Call initializeSocket first.');
    }
    return _socket!;
  }

  void initializeSocket(String token) {
    _socket = IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {'token': token},
    });
    _socket!.connect();
  }

  bool get isInitialized => _socket != null;

  void joinRoom(String targetId) {
    socket.emit('join-room', {'target': targetId});
  }

  void sendGroupMessage(String message) {
    socket.emit('group-chat', {'message': message});
  }

  void listenToRooms(Function(List<ChatRoom>) onRooms) {
    socket.on('rooms', (data) {
      final rooms =
          (data as List).map((room) => ChatRoom.fromJson(room)).toList();
      onRooms(rooms);
    });
  }

  void listenToMe(Function(String) onMe) {
    socket.on('me', (data) => onMe(data.toString()));
  }

  void listenToChats(Function(List<ChatMessage>) onChats) {
    socket.on('chats', (data) {
      final messages =
          (data as List).map((msg) => ChatMessage.fromJson(msg)).toList();
      onChats(messages);
    });
  }

  void listenToRoomUsers(Function(List<String>) onRoomUsers) {
    socket.on('room_users', (data) {
      final users = List<String>.from(data);
      onRoomUsers(users);
    });
  }

  void listenToMessage(Function(ChatMessage) onMessage) {
    socket.on('message', (data) {
      final message = ChatMessage.fromJson(data);
      onMessage(message);
    });
  }

  void dispose() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket = null;
    }
  }
}
