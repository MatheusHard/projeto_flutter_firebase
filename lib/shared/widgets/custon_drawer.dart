
import 'package:flutter/material.dart';
import 'package:projeto_flutter_2024_1/pages/whatzap/whatzap_page.dart';
import '../../pages/chat/chat_page.dart';



class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:
        [
          InkWell(
            onTap:(){
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  context: context,
                  builder: (BuildContext context){
                    return  Wrap(
                      children:  [
                        ListTile(
                          onTap: (){
                            print("CAMERA");
                          },
                          title: const Text("CAmera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: (){
                            print("GAleria");
                          },
                          title: const Text("GAleria"),
                          leading: const Icon(Icons.browse_gallery),
                        )
                      ],
                    );
                  });
            } ,
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3)
                ),
                currentAccountPicture:
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png"
                    )),
                accountName: const Text("Matheus Hardman"),
                accountEmail: const Text("burumungu@gmail.com")),
          ),


          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
               // Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=>   ChatPage()));
              },
              child: const Row(
                children:  [
                  Icon(Icons.checklist_rtl_sharp),
                  SizedBox(width: 20),
                  Text("Chat Page"),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext bd)=>  const WhatZapPage()));
              },
              child: const Row(
                children:  [
                  Icon(Icons.message_outlined),
                  SizedBox(width: 20),
                  Text("Whatszapp Page"),
                ],
              ),
            ),
          ),

          const Divider(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: InkWell(
                onTap: (){
                  _alertSair();
                },
                child: const Row(
                  children:  [
                    Icon(Icons.exit_to_app_rounded),
                    SizedBox(width: 20),
                    Text("SAIR"),
                  ],)
            ),
          ),

        ],
      ),
    );
  }
  _alertSair(){

    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.centerLeft,
        elevation: 8,
        title: const Text("APP"),
        content: Wrap(
          children: const [
            Text("Deseja Sair!"),
            Text("Deseja realmente sair?")
          ],
        ),
        actions: [
          TextButton(
              onPressed: (){
                // Navigator.pushReplacement(
                //context,
                //  MaterialPageRoute(builder: (context)=> const Logi))
                print("SAINDOOOOO");
              }, child: const Text("SIM")),
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("NÃO"))
        ],
      );
    });

  }
}
