import 'package:carma_app/src/core/services/socket_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/chat/data/model/chat_message_model.dart';
import 'package:carma_app/src/features/user_app/chat/data/model/chat_room_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  final SocketService _socketService;
  final UserService _userService;
  final String roomId;

  List<ChatMessage> messages = [];
  bool isLoading = true;
  TextEditingController messageController = TextEditingController();

  String get currentUserId => _userService.currentUser!.id ?? '';

  ChatViewModel(this._socketService, this._userService, this.roomId) {
    initializeSocket();
  }

  Future<void> initializeSocket() async {
    try {
      AppLogger.log('Initializing socket for chat room: $roomId',
          tag: 'ChatViewModel');
      _socketService.joinRoom(roomId);
      _setupSocketListeners();

      AppLogger.logSuccess('Socket initialized successfully for chat room',
          tag: 'ChatViewModel');
    } catch (e) {
      AppLogger.logError('Error initializing socket for chat room: $e',
          tag: 'ChatViewModel');
      isLoading = false;
      notifyListeners();
    }
  }

  void _setupSocketListeners() {
    _socketService.listenToChats((chatMessages) {
      AppLogger.log('Received chat messages: ${chatMessages.length}',
          tag: 'ChatViewModel');
      messages = chatMessages;
      isLoading = false;
      notifyListeners();
    });

    _socketService.listenToMessage((message) {
      AppLogger.log('Received new message: ${message.text}',
          tag: 'ChatViewModel');
      messages.add(message);
      notifyListeners();
    });
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      AppLogger.log('Sending message: ${messageController.text}',
          tag: 'ChatViewModel');
      final message = ChatMessage(
        text: messageController.text,
        uid: currentUserId,
        time: DateTime.now(),
      );
      _socketService.sendGroupMessage(messageController.text);
      messageController.clear();
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    AppLogger.log('Disposing chat view model', tag: 'ChatViewModel');
    super.dispose();
  }
}
