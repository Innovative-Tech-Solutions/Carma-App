import 'package:flutter/material.dart';

class ChatViewScreen extends StatefulWidget {
  const ChatViewScreen({super.key});

  @override
  State<ChatViewScreen> createState() => _ChatViewScreenState();
}

class _ChatViewScreenState extends State<ChatViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, // Background color
      body: SafeArea(
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
                        backgroundImage: AssetImage('assets/user_avatar.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Chats Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: const [
                    // Replace with dynamic chat item generation
                    ChatItem(
                      imageUrl: 'assets/justin_samuel.png',
                      name: 'Justin Samuel',
                      message: 'Alright I\'ll be there shortly..',
                      time: '15:04',
                    ),
                    ChatItem(
                      imageUrl: 'assets/ahmed_adefemi.png',
                      name: 'Ahmed Adefemi',
                      message: 'what time are you coming?',
                      time: '17:52',
                    ),
                    ChatItem(
                      imageUrl: 'assets/jenny_summer.png',
                      name: 'Jenny Summer',
                      message: 'Hello! how are you? ...',
                      time: '03:41',
                    ),
                    ChatItem(
                      imageUrl: 'assets/aliya_uthman.png',
                      name: 'Aliya Uthman',
                      message: 'Thanks for coming!',
                      time: '05:27',
                    ),
                    ChatItem(
                      imageUrl: 'assets/george_gibson.png',
                      name: 'George Gibson',
                      message: 'okay I\'ll be expecting you ...',
                      time: '12:33',
                    ),
                    ChatItem(
                      imageUrl: 'assets/mary_sally.png',
                      name: 'Mary Sally',
                      message: 'Voice call 3:04',
                      time: '04:03',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final String time;

  const ChatItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  style: TextStyle(
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
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
