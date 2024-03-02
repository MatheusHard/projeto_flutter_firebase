import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String nickName;

  const ChatPage({super.key, required this.nickName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  var controllerTexto = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Chat"),),
      body: Container(child: Column(
        children: [
          Expanded(child: ListView()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(25)
            ),
            child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none
                  ),
                  style: const TextStyle(fontSize: 18),
                  controller: controllerTexto,
                ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.send))
            ],
          ),)
        ],
      ),),
    ));
  }
}
