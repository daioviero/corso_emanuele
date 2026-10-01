import 'package:uuid/uuid.dart';

import 'message.dart';

class ChatInfo {
  late final String id;
  final String sender;
  final List<Message> messages;
  final String image;

  ChatInfo({required this.sender, required this.messages, required this.image})
    : id = Uuid().v4();
}
