import 'package:flutter/material.dart';
import 'package:projeto_flutter_2024_1/models/chat_model.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chatModel;
  final bool myMessage;
  const ChatWidget({super.key, required this.chatModel, required this.myMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: myMessage ?
      Alignment.centerRight:
      Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: myMessage ?
            Colors.blue :
            Colors.green
        ),
        child: Column(
          children: [
            Text(chatModel.nickName,
              style: const TextStyle(color: Colors.white),),
            Text(chatModel.texto,
              style: const TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
