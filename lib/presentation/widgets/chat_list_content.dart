import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/models/chat_info.dart';
import '../router/route_names.dart';
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
        //onTapCustom: () => saluta(_titoloChat[index]),
        // onTapCustom: () => Navigator.of(context).push(
        //   MaterialPageRoute<void>(
        //     builder: (context) => ChatPage(
        //       titolo: _titoloChat[index],
        //       message: _subtitoloChat[index],
        //       photoProfile: _immagini[index],
        //       orario: DateFormat('HH:mm').format(_orario[index]),
        //     ),
        //   ),
        // ),
        onTapCustom: () =>
            /* Questo è più adatto per navigazioni tipo cambio-tab,
        * dove non ha senso "tornare indietro" alla schermata precedente.
        //    GoRouter.of(context).go('/chat', extra: {
        //   'titolo': _titoloChat[index],
        //   'message': _subtitoloChat[index],
        //   'photoProfile': _immagini[index],
        //   'orario': DateFormat('HH:mm').format(_orario[index]),
        // },)
        */
            // Questo è più utile quando hai bisogno di costruire uno stack di pagine
            contex.pushNamed(
              RouteNames.chat,
              pathParameters: {'chatId': chats[index].id},
              // extra: {
              //   'titolo': titoloChat[index],
              //   'message': subtitoloChat[index],
              //   'photoProfile': immagini[index],
              //   'orario': DateFormat('HH:mm').format(orario[index]),
              // },
            ),
      ),
    );
  }
}
