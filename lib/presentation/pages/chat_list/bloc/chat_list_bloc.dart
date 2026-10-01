import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/chat_info.dart';
import '../../../../data/repositories/chat_repository.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatRepository _chatRepository;

  ChatListBloc({required this._chatRepository}) : super(ChatListLoading()) {
    on<LoadChatListEvent>((event, emit) async {
      emit(ChatListLoading());
      final List<ChatInfo> chats = await _chatRepository.getChatList();
      emit(ChatListSuccess(chats));
    });
  }
}
