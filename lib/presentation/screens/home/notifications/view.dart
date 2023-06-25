import 'package:flutter/material.dart';

class Notificationspadg extends StatelessWidget {
  const Notificationspadg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff9DD549),
            title: const Row(
              children: [
                BackButtonIcon(
                ),
                SizedBox(
                  width: 77,
                ),Text(
                "Notifications",
                textAlign: TextAlign.right,
              )],
            )
           ),
      ),

    );
  }
}
