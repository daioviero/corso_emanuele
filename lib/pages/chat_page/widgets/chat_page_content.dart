import 'package:corso_emanuele/models/chat_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../router/route_names.dart';
import 'chat_bubble.dart';

class ChatPageContent extends StatelessWidget {
  final ChatInfo chat;

  const ChatPageContent({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B5E20),
        leading: BackButton(color: Colors.white),
        title: Text(
          chat.sender,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(chat.image),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            // Questo più utile quando ho un menù fisso
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 20,
                children: chat.messages
                    .map(
                      (m) => ChatBubble(
                        message: m.body,
                        orario: DateFormat('HH:mm').format(m.dateTime),
                        isMine: m.isMine,
                      ),
                    ).toList(),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        onPressed: () => context.goNamed(RouteNames.chatList),
        child: const Icon(Icons.home, color: Colors.white),
      ),
    );
  }
}
