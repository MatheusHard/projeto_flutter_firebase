import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatZapPage extends StatefulWidget {
  const WhatZapPage({super.key});

  @override
  State<WhatZapPage> createState() => _WhatZapPageState();
}

class _WhatZapPageState extends State<WhatZapPage> {
  final Uri phoneNUmber = Uri.parse("tel:+5583988709050");
  final Uri phoneClient = Uri.parse("https://wa.me/+5583986608688");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ZAP"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await launchUrl(phoneClient);
                },
                child: const Text("ZAP Mensagens")),
            ElevatedButton(
                onPressed: () async {
                  await canLaunchUrl(phoneNUmber);
                },
                child: const Text("Tel")),
          ],
        ),
      ),
    );
  }
}
