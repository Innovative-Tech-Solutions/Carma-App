import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text('Justin Samuel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.white),
            onPressed: () {
              // Handle phone button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.video_call, color: Colors.white),
            onPressed: () {
              // Handle video call button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Center(
                      child: Text('-Saturday-',
                          style: TextStyle(color: Colors.grey))),
                  _buildReceivedMessage(
                      'I wont be around tomorrow but we can meet on monday',
                      '14:32'),
                  _buildReceivedMessage('I would be ready by then.', '14:32'),
                  _buildSentMessage(
                      "That's fair enough, but i'll be going to work on monday.",
                      '14:40'),
                  _buildSentMessage(
                      'So you have to come in the evening', '14:40'),
                  const Center(
                      child: Text('-Monday-',
                          style: TextStyle(color: Colors.grey))),
                  _buildReceivedMessage(
                      'What time are you leaving work?', '11:34'),
                  _buildSentMessage('I’ll be back by 4pm', '14:44'),
                  _buildReceivedMessage(
                      'Alright i’ll be there shortly', '15:04'),
                ],
              ),
            ),
            _buildInputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildReceivedMessage(String message, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CircleAvatar(
            radius: 16.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, style: const TextStyle(color: Colors.black)),
                  const SizedBox(height: 4.0),
                  Text(time,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 10.0)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(String message, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(message, style: const TextStyle(color: Colors.black)),
                  const SizedBox(height: 4.0),
                  Text(time,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 10.0)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          const CircleAvatar(
            radius: 16.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message ...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle send button press
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: ChatScreen()));
}
