import 'package:flutter/material.dart';
import 'package:projeto_flutter_2024_1/pages/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
      MaterialApp(
        title: 'DIO',
        debugShowCheckedModeBanner: false,
        routes: {
          '/home_page': (BuildContext context) => const Home(),

        },
        initialRoute: '/home_page',
      ));
}

