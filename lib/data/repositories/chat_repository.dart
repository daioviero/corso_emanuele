import '../models/chat_info.dart';
import '../models/message.dart';

class ChatRepository {

  final List<ChatInfo> _list = [
    ChatInfo(
      image: "assets/images/dado1.png",
      sender: "Papa'",
      messages: [
        Message(
          body: "Ciao Papa'",
          dateTime: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Message(
          body: "Come va?",
          dateTime: DateTime.now().subtract(Duration(minutes: 2)),
        ),
      ],
    ),
    ChatInfo(
      image: 'assets/images/dado2.png',
      sender: "Andreea",
      messages: [
        Message(
          body: "Rispondi al telefono...",
          dateTime: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Message(
          body: "Sto lavorando, a dopo!!!",
          dateTime: DateTime.now().subtract(Duration(minutes: 2)),
        ),
      ],
    ),
    ChatInfo(
      image: 'assets/images/dado3.png',
      sender: "Mamma",
      messages: [
        Message(
          isMine: true,
          body: "5 minuti e sono da te",
          dateTime: DateTime.now().subtract(Duration(minutes: 3)),
        ),
        Message(
          isMine: false,
          body: "E' pronta la cena",
          dateTime: DateTime.now().subtract(Duration(minutes: 2)),
        ),
      ],
    ),
  ];

  Future<List<ChatInfo>> getChatList() async {
    await Future.delayed(Duration(seconds: 3));
    return _list;
  }

  Future<ChatInfo> getChatMessages(String id) async {
    await Future.delayed(Duration(seconds: 1));
    return _list.firstWhere((e) => e.id==id);
  }
}
