import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter_2024_1/pages/chat_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


import '../shared/widgets/custon_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var controllerNick = TextEditingController(text: '');

  @override
  void initState() {
    generadeId();
    super.initState();
  }

  generadeId() async {

    var uuid = const Uuid();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', uuid.v4());

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Firebase")),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Informe o apelidio"),
              TextField(
                controller: controllerNick,
              ),
              TextButton(
                  onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext bd) =>
                        ChatPage(nickName: controllerNick.text,)));

              }, child: const Text("Entar do Chat"))
            ],
          )
        ),
      ),
      drawer: const DrawerCustom(),
    );

  }
}
