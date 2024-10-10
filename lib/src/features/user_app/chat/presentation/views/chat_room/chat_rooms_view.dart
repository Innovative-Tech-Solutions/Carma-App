import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/services/socket_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/shared/shimmer_effect.dart';
import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/features/user_app/chat/presentation/views/chat_room/chat_room_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatRoomsView extends StackedView<ChatRoomsViewModel> {
  const ChatRoomsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ChatRoomsViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: RefreshIndicator(
        onRefresh: viewModel.refreshConnection,
        child: SafeArea(
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    Text(
                      'Chat with your clients',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Chats Section
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: viewModel.isLoading
                      ? _buildLoadingList()
                      : ListView.builder(
                          padding: const EdgeInsets.all(16.0),
                          itemCount: viewModel.rooms.length,
                          itemBuilder: (context, index) {
                            final room = viewModel.rooms[index];
                            final participant = room.participantsData.first;
                            return ChatItem(
                              imageUrl: 'assets/images/avatar.png',
                              name: participant.name,
                              message: "Tap to open chat",
                              time: "Recent",
                              onTap: () => viewModel.navigateToChat(room.id),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return ShimmerEffect(
          child: ChatItem(
            imageUrl: 'assets/images/avatar.png',
            name: 'Loading...',
            message: 'Loading...',
            time: '...',
            onTap: () {},
          ),
        );
      },
    );
  }

  @override
  ChatRoomsViewModel viewModelBuilder(BuildContext context) =>
      ChatRoomsViewModel(
        locator<NavigationService>(),
        locator<SocketService>(),
        locator<UserService>(),
      );
}

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final String time;
  final VoidCallback onTap;

  const ChatItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
