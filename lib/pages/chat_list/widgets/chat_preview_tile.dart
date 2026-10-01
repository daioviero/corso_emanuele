import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/chat_info.dart';

class ChatPreviewTile extends StatelessWidget {
  const ChatPreviewTile({
    super.key,
    required this.onTapCustom,
    required this.chatInfo,
  });

  final VoidCallback onTapCustom;
  final ChatInfo chatInfo;

  void test() => print('Ciao');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTapCustom(),
      onLongPress: test,
      leading: CircleAvatar(backgroundImage: AssetImage(chatInfo.image)),
      title: Text(
        chatInfo.sender,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        chatInfo.messages.last.body,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        DateFormat('HH:mm').format(chatInfo.messages.last.dateTime),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
