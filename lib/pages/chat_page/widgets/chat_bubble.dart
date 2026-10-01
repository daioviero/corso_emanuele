import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  const new({
    super.key,
    required this.message,
    required this.orario,
    required this.isMine,
  });

  final String? message;
  final String? orario;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    Color bubbleColor = isMine ? Color(0xFF1B5E20) : Colors.grey[850]!;
    Alignment blubbleAlignment = isMine
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Align(
      alignment: blubbleAlignment,
      child: Container(
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            // Così mi muovo in base alla dimensione della finestra
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$message',
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$orario',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
