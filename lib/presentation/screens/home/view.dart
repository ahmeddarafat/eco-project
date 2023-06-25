import 'package:flutter/material.dart';

import 'promo_code/promo_code.dart';
import 'home/view.dart';
import 'map/view.dart';
import 'notifications/view.dart';
import 'setting/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pages = [
    const HomePage(),
    const SettingPage(),
    const Promocode(),
    const Notificationspadg(),
    const MapPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          // backgroundBlendMode: BlendMode.color,
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          // boxShadow: [
          //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          // ],
        ),
        // height: MediaQuery.of(context).size.height * 0.086,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF9DD549),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined,
                      size: 30, color: Colors.white.withOpacity(.8)),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings,
                      size: 30, color: Colors.white.withOpacity(.8)),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.earbuds,
                      size: 30, color: Colors.white.withOpacity(.8)),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_alert_outlined,
                      color: Colors.white.withOpacity(.8), size: 30),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined,
                      color: Colors.white.withOpacity(.9), size: 30),
                  label: ""),
            ],
            currentIndex: currentPage,
            onTap: (int index) {
              currentPage = index;
              setState(() {});
            },
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
