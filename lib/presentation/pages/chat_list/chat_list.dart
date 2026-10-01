import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/chat_repository.dart';
import '../../widgets/chat_list_content.dart';
import 'bloc/chat_list_bloc.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  void saluta(String name) => print('Ciao $name');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            tooltip: 'Trova la chat',
            onPressed: () {
              print("Ti stai divertendo !!!");
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              print("Ti stai divertendo !!!");
            },
          ),
        ],
        backgroundColor: Color(0xFF1B5E20),
      ),
      body: BlocProvider(
        create: (context) => ChatListBloc(
          chatRepository: RepositoryProvider.of<ChatRepository>(context),
        )..add(LoadChatListEvent()),
        child: BlocConsumer<ChatListBloc, ChatListState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ChatListLoading)
              return CircularProgressIndicator();
            else
              return ChatListContent(chats: (state as ChatListSuccess).chats);
          },
        ),
      ),
      // Bottono New Chat
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
