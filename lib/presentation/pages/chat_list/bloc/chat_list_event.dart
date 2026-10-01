part of 'chat_list_bloc.dart';

sealed class ChatListEvent extends Equatable {
  const ChatListEvent();
}

class LoadChatListEvent extends ChatListEvent {
  @override
  List<Object?> get props => [];
}