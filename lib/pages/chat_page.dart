import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter_2024_1/models/chat_model.dart';
import 'package:projeto_flutter_2024_1/shared/widgets/chat_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String nickName;

  const ChatPage({super.key, required this.nickName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final db = FirebaseFirestore.instance;
  var controllerTexto = TextEditingController(text: '');
  String? userId;

  @override
  void initState() {
    getUserId();
    super.initState();
  }
  getUserId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId  = prefs.getString('userId');
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Chat"),),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection("chats").
                           orderBy("dataHora", descending: false).
                           snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData ?
                        const Center(child: CircularProgressIndicator()) :
                              ListView(
                                children: snapshot.data!.docs.map((e) {
                                  var chatModel = ChatModel.fromJson((e.data() as Map<String, dynamic>));
                                  return ChatWidget(
                                                    chatModel: chatModel,
                                                    myMessage: chatModel.userId == userId
                                                    );
                                }).toList()
                              );
                }
              )
          ),
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
              IconButton(onPressed: () async {
                var chat = ChatModel(userId: userId!, texto: controllerTexto.text, nickName: widget.nickName);
                await db.
                collection("chats").
                add(chat.toJson());
                controllerTexto.clear();
              }, icon: const Icon(Icons.send))
            ],
          ),)
        ],
      ),
    ));
  }
}
