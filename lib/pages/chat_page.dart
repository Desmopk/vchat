import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

class ChatPage extends StatefulWidget {
  final String receiverEmail;

  ChatPage({required this.receiverEmail, super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late WebSocketChannel channel;
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [];
  final String senderEmail = FirebaseAuth.instance.currentUser!.email!;

  @override
  void initState() {
    super.initState();
    channel = WebSocketChannel.connect(Uri.parse('ws://192.168.1.5:8080'));
    channel.sink.add(jsonEncode({'type': 'register', 'email': senderEmail}));

    channel.stream.listen((data) {
      final msg = jsonDecode(data);
      if (msg['type'] == 'message') {
        setState(() {
          messages.add({'text': msg['text'], 'sender': msg['senderEmail']});
        });
      }
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final message = {
        'type': 'message',
        'text': _controller.text,
        'senderEmail': senderEmail,
        'receiverEmail': widget.receiverEmail,
      };
      channel.sink.add(jsonEncode(message));
      setState(() {
        messages.add({'text': _controller.text, 'sender': senderEmail});
        _controller.clear();
      });
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverEmail)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ListTile(
                  title: Align(
                    alignment: msg['sender'] == senderEmail
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: msg['sender'] == senderEmail
                            ? Colors.blue
                            : Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(msg['text']!),
                    ),
                  ),
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
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
