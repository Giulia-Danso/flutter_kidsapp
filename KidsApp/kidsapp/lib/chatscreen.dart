import 'package:flutter/material.dart';
import 'contact.dart';

class ChatScreen extends StatefulWidget {
  final Contact contact;

  ChatScreen({required this.contact});

  @override
  _ChatScreenState createState() => _ChatScreenState(contact: contact);
}

class _ChatScreenState extends State<ChatScreen> {
  final Contact contact;
  final List<String> messages = [];
  final TextEditingController messageController = TextEditingController();

  _ChatScreenState({required this.contact});

  void _sendMessage(String message) {
    setState(() {
      messages.add(message);
    });
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(contact.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
