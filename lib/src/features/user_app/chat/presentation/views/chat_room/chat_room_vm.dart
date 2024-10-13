import 'package:carma_app/src/app/app_setup.router.dart';
import 'package:carma_app/src/core/services/socket_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/chat/data/model/chat_room_model.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatRoomsViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final SocketService _socketService;
  final UserService _userService;

  List<ChatRoom> rooms = [];
  bool isLoading = true;
  bool isConnected = false;
  bool hasError = false;

  ChatRoomsViewModel(
      this._navigationService, this._socketService, this._userService) {
    initializeSocket();
  }

  Future<void> initializeSocket() async {
    try {
      isLoading = true;
      hasError = false;
      notifyListeners();

      AppLogger.log('Initializing socket for chat rooms',
          tag: 'ChatRoomsViewModel');

      _socketService
          .initializeSocket(_userService.currentUser!.activationToken ?? '');

      _socketService.socket.on('connect', (_) {
        AppLogger.log("Successfully connected to Server",
            tag: "ChatRoomsViewModel");
        isLoading = false;
        isConnected = true;
        hasError = false;
        notifyListeners();
        _setupSocketListeners();
        Toast.showSuccessToast(message: 'Connected to server successfully');
      });

      _socketService.socket.on('connect_error', (data) {
        AppLogger.logError("Error connecting to socket",
            tag: "ChatRoomsViewModel");
        isConnected = false;
        hasError = true;
        isLoading = false;
        notifyListeners();
        Toast.showErrorToast(message: 'Unable to connect to server');
      });

      _socketService.socket.on('disconnect', (_) {
        AppLogger.logError("Disconnected from socket",
            tag: "ChatRoomsViewModel");
        isConnected = false;
        notifyListeners();
        Toast.showWarningToast(message: 'Disconnected from server');
      });

      Future.delayed(const Duration(seconds: 10), () {
        AppLogger.log("Reached loading time of 10 seconds",
            tag: "ChatRoomsViewModel");
        if (!isConnected && isLoading) {
          isLoading = false;
          hasError = true;
          notifyListeners();
          Toast.showErrorToast(message: 'Connection timeout. Please try again');
        }
      });

      AppLogger.logSuccess('Socket initialized successfully',
          tag: 'ChatRoomsViewModel');
    } catch (e) {
      AppLogger.logError('Error initializing socket: $e',
          tag: 'ChatRoomsViewModel');
      isLoading = false;
      hasError = true;
      notifyListeners();
      Toast.showErrorToast(
          message:
              'Error connecting to server. Please check your internet connection');
    }
  }

  void _setupSocketListeners() {
    _socketService.listenToRooms((updatedRooms) {
      AppLogger.log('Received updated rooms: ${updatedRooms.length}',
          tag: 'ChatRoomsViewModel');
      rooms = updatedRooms;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> refreshConnection() async {
    await initializeSocket();
  }

  void navigateToChat(String roomId) {
    AppLogger.log('Navigating to chat room: $roomId',
        tag: 'ChatRoomsViewModel');
    _navigationService.navigateTo(
      Routes.chatView,
      arguments:
          ChatViewArguments(roomId: roomId, user: _userService.currentUser!),
    );
  }
}
