part of 'chat_page_bloc.dart';

sealed class ChatPageEvent extends Equatable {
  const ChatPageEvent();
}

class LoadChatEvent extends ChatPageEvent {
  LoadChatEvent(this.chatId);

  final String chatId;

  @override
  List<Object?> get props => [chatId];
}