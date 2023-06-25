import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff9DD549),
          title: const Row(
            children: [
              BackButtonIcon(
              ),
              SizedBox(
                width: 77,
              ),Text(
                "Vendor Details",
                textAlign: TextAlign.right,
              )],
          )
      ),


    );
  }
}
