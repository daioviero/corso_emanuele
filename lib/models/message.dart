class Message {
  final String body;
  final DateTime dateTime;
  final bool isMine;

  Message({required this.body, required this.dateTime, this.isMine = false});
}
