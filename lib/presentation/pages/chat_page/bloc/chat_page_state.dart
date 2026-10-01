part of 'chat_page_bloc.dart';

sealed class ChatPageState extends Equatable {
  const ChatPageState();
}

class ChatPageLoading extends ChatPageState {
  @override
  List<Object?> get props => [];
}

class ChatPageSuccess extends ChatPageState {
  ChatPageSuccess(this.chat);

  final ChatInfo chat;

  @override
  List<Object?> get props => [chat];
}

class ChatPageError extends ChatPageState {
  final String error;
  ChatPageError(this.error);

  @override
  List<Object?> get props => [error];
}
