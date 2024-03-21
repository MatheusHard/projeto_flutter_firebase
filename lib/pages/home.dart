import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_flutter_2024_1/pages/chat/chat_choice.dart';
import 'package:projeto_flutter_2024_1/pages/chat/chat_page.dart';
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

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: controllerNick,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Coloque seu Nickname',
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(

                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        ///Chat de Esportes
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext bd) =>
                                  ChatPage(nickName: controllerNick.text, chatType: "esportes",)));

                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFF8C3B),
                                Color(0xFFFF6365),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Esporte',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Netflix",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ///Chat de NOvelas
                          Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext bd) =>
                          ChatPage(nickName: controllerNick.text, chatType: "novelas",)));

                          },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.green
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Novelas',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Netflix",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          ///Chat de NOticias
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext bd) =>
                                  ChatPage(nickName: controllerNick.text, chatType: "noticias",)));

                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow,
                                Colors.grey
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Noticias',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Netflix",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          ///Chat de FIlmes
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext bd) =>
                                  ChatPage(nickName: controllerNick.text, chatType: "filmes",)));

                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26,
                                Colors.white
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Filmes',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Netflix",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 0.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),

              /* TextButton(
                  onPressed:() {
                   /* Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext bd) =>
                        ChatPage(nickName: controllerNick.text,)));*/
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext bd) =>
                            const ChatChoice()));

              }, child: const Text("Entar do Chat"))*/
            ],
          )
        ),
      ),
      drawer: const DrawerCustom(),
    );


  }
  showSnackBar(var error){
    return SnackBar(
      content: Text(error),
     /* action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),*/
    );
  }
}
