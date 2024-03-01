import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var db = FirebaseFirestore.instance;
  
  final pet = <String, dynamic>{
    "name": "Popoto",
    "idade": 4
  };
  
  @override
  Widget build(BuildContext context) {
    db.collection("pets").add(pet).then((value) => print("Gerado com sucesso: ${value.id}"));
    return Container(
      color: Colors.amber,
    );
  }
}
