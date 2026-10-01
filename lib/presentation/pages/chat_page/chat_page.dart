import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../data/repositories/chat_repository.dart';
import '../../router/route_names.dart';
import '../../widgets/chat_bubble.dart';
import 'bloc/chat_page_bloc.dart';

/* Passare da fuori il nome del contatto
      e contruire un'altra pagina in cui nell'app bar compare
   */

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatPageBloc(
        chatRepository: RepositoryProvider.of<ChatRepository>(context),
      )..add(LoadChatEvent(chatId)),
      child: BlocConsumer<ChatPageBloc, ChatPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ChatPageLoading)
            return CircularProgressIndicator();
          final chat = (state as ChatPageSuccess).chat;

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
              // Expand() Espande il figlio all'interno del padre per occupare tutto lo spazio possibile (usato spesso)
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
                          )
                          .toList(),
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
        },
      ),
    );
  }
}
