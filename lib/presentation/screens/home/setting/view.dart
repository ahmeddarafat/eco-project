import 'package:eco_project/core/helper_method.dart';
import 'package:eco_project/presentation/screens/auth/login/view.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9DD549),
        centerTitle: true,
        title: const Text(
          "Setting",
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18, top: 14),
                child: Text(
                  "USER",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff969796),
                  ),
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 9),
                      child: Row(
                        children: [
                          const Text(
                            "Profile",
                            style: TextStyle(color: Color(0xff1E1E1E)),
                          ),
                          const SizedBox(
                            width: 250,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, top: 9),
                  child: Row(
                    children: [
                      const Text(
                        "Change Password",
                        style: TextStyle(color: Color(0xff1E1E1E)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, top: 14),
                child: Text(
                  "LANGUAGE",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff969796),
                  ),
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18, top: 9),
                        child: Row(
                          children: [
                            const Text(
                              "Change Language",
                              style: TextStyle(color: Color(0xff1E1E1E)),
                            ),
                            const SizedBox(width: 115),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "English",
                                  style: TextStyle(
                                      color: Color(0xff9DD549), fontSize: 13),
                                ))
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18, top: 9),
                        child: Row(
                          children: [
                            const Text(
                              "Allow Tips Displayed ",
                              style: TextStyle(color: Color(0xff1E1E1E)),
                            ),
                            const SizedBox(
                              width: 130,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward))
                          ],
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, top: 14),
                child: Text(
                  "RED",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff969796),
                  ),
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18, top: 9),
                        child: Row(
                          children: [
                            const Text(
                              "Term of use",
                              style: TextStyle(color: Color(0xff1E1E1E)),
                            ),
                            const SizedBox(
                              width: 210,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined))
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18, top: 9),
                        child: Row(
                          children: [
                            const Text(
                              "Privacy & Policy ",
                              style: TextStyle(color: Color(0xff1E1E1E)),
                            ),
                            const SizedBox(
                              width: 174,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined))
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18, top: 9),
                        child: Row(
                          children: [
                            const Text(
                              "About us ",
                              style: TextStyle(color: Color(0xff1E1E1E)),
                            ),
                            const SizedBox(
                              width: 230,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined))
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 18, top: 9),
                        child: Row(
                          children: [
                            const Text(
                              "Awareness ",
                              style: TextStyle(color: Color(0xff1E1E1E)),
                            ),
                            const SizedBox(
                              width: 215,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined))
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140, top: 5),
                child: TextButton(
                  onPressed: () {
                    navigateTo(page: const LoginScreen(),withHistory: false);
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(color: Color(0xffFF0000), fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
