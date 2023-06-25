import 'package:eco_project/core/helper_method.dart';
import 'package:eco_project/presentation/screens/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          controller.currentPage = value;
          setState(() {});
        },
        children: List.generate(
          controller.models.length,
          (index) => SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: Image.asset(
                          controller.models[controller.currentPage].background!,
                          height: 550,
                          width: 400,
                          fit: BoxFit.fill,
                          color: const Color(0xffDBFFA4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 30, right: 30),
                        child: Image.asset(
                          controller.models[controller.currentPage].imageUrl!,
                          height: 350,
                          // width: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    controller.models[controller.currentPage].title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  controller.currentPage == controller.models.length - 1
                      ? ElevatedButton(
                          onPressed: () {
                            navigateTo(
                                page: const LoginScreen(), withHistory: false);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ), backgroundColor: const Color(0xff9DD549),
                            shadowColor: const Color(0xffFF6EA1),
                            fixedSize: const Size(343, 48),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 20),
                          ))
                      : const SizedBox(),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        controller.models.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 40),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(
                                    index == controller.currentPage
                                        ? 0xff9DD549
                                        : 0xffD6D6D6),
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
