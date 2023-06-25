import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/helper_method.dart';
import '../on_boarding/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigateTo(page: const OnBoardingScreen(), withHistory: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset("assets/images/group.png"),
          ),
        ],
      ),
    );
  }
}
