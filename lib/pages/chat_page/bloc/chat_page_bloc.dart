import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/chat_info.dart';
import '../../../repositories/chat_repository.dart';

part 'chat_page_event.dart';
part 'chat_page_state.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatPageBloc({required this.chatRepository}) : super(ChatPageLoading()) {
    on<LoadChatEvent>((event, emit) async {
      emit(ChatPageLoading());
      final chat = await chatRepository.getChatMessages(event.chatId);
      emit(ChatPageSuccess(chat));
    });
  }

  final ChatRepository chatRepository;
}
