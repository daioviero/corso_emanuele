part of 'chat_list_bloc.dart';

sealed class ChatListState extends Equatable {
  const ChatListState();
}

final class ChatListLoading extends ChatListState {
  @override
  List<Object> get props => [];
}

final class ChatListSuccess extends ChatListState {
  final List<ChatInfo> chats;
  ChatListSuccess(this.chats);

  @override
  List<Object?> get props => [chats];
}


final class ChatListError extends ChatListState {
  final String error;
  ChatListError(this.error);

  @override
  List<Object?> get props => [error];
}