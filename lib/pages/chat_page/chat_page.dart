import 'package:corso_emanuele/pages/chat_page/widgets/chat_page_content.dart';
import 'package:corso_emanuele/pages/chat_page/widgets/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/chat_repository.dart';
import 'bloc/chat_page_bloc.dart';

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
          if (state is ChatPageError)
            return ErrorPage(error: state.error);
          else if (state is ChatPageLoading)
            return Center(child: CircularProgressIndicator());
          else
            return ChatPageContent(chat: (state as ChatPageSuccess).chat);
        },
      ),
    );
  }
}