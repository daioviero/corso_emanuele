import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/chat_info.dart';
import '../../../router/route_names.dart';
import 'chat_preview_tile.dart';

class ChatListContent extends StatelessWidget {
  const ChatListContent({super.key, required this.chats});

  final List<ChatInfo> chats;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chats.length,
      separatorBuilder: (contex, index) =>
          const Divider(color: Color(0xFF1B5E20)),
      itemBuilder: (contex, index) => ChatPreviewTile(
        chatInfo: chats[index],
        onTapCustom: () => contex.pushNamed(
          RouteNames.chat,
          pathParameters: {'chatId': chats[index].id},
        ),
      ),
    );
  }
}
