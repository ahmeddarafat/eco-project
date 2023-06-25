import 'package:eco_project/core/cache_helper.dart';
import 'package:eco_project/core/helper_method.dart';
import 'package:eco_project/presentation/screens/home/view.dart';
import 'package:flutter/material.dart';

class ConfirmationCode extends StatefulWidget {
  final bool showDialog;
  const ConfirmationCode({
    super.key,
    this.showDialog = false,
  });

  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  String userName = "";
  int points = 0;

  @override
  void initState() {
    super.initState();
    userName = CacheHelper.getName();
    points = CacheHelper.getCounter();

    Future.delayed(
      Duration.zero,
      () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Column(
                children: [
                  Image.asset("assets/images/emogie.png"),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    "Congrats!",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff1E1E1E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text("You earned 100 points with\nyour last recycling.",
                      style: TextStyle(fontSize: 15, color: Color(0xff969796))),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigateTo(page: const HomeView());
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(231, 56),
                      backgroundColor: const Color(0xff9DD549),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Back To Home",
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: (const EdgeInsets.only(
                    top: 41,
                    left: 24,
                    right: 24,
                  )),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, $userName!",
                            style: const TextStyle(
                                fontSize: 18, color: Color(0xff9DD549)),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "Let’s contribute to our earth.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff969796),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                    height: 127,
                    width: 327,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Color(0xff9DD549),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/dollar-front-color.png",
                              width: 29,
                              height: 29,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text("222",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF), fontSize: 20)),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text("POINTS",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF), fontSize: 12))
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const VerticalDivider(
                          color: Color(0xffFFFFFF),
                          thickness: 2,
                          width: 4,
                          indent: 27,
                          endIndent: 32,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/chart-front-color.png",
                              width: 29,
                              height: 29,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              "000",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "SAVED co2",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const VerticalDivider(
                          color: Color(0xffFFFFFF),
                          thickness: 2,
                          width: 4,
                          indent: 27,
                          endIndent: 32,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/bag-front-color.png",
                              width: 29,
                              height: 29,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text("000",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF), fontSize: 20)),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text("RECYCLED",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF), fontSize: 12))
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text("Your Mission", textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 17,
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/earn_now.png",
                      height: 177,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 50),
                      child: Column(
                        children: [
                          const Text("Recycle 5 plastic",
                              style: TextStyle(
                                  color: Color(0xffFFFFFF), fontSize: 15)),
                          const Text("EARN 100\nPOINTS",
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xffFFFFFF))),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "Earn now",
                                style: TextStyle(color: Color(0xff9DD549)),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff9DD549), width: 5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Image.asset('assets/images/metal.png'),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff9DD549), width: 5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Image.asset('assets/images/paper.png'),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff9DD549),
                              width: 5,
                              style: BorderStyle.solid),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Image.asset('assets/images/plastic.png'),
                      ),
                    ],
                  ),

                  // ListView.separated(
                  //   itemBuilder: (context, index) {
                  //     GestureDetector(
                  //       child: Image.asset("assets/images/metal.png",height: 10,width: 10,),
                  //
                  //     );
                  //   },
                  //   itemCount: 1,
                  //   scrollDirection: Axis.horizontal,
                  //   separatorBuilder: (BuildContext context,int index){
                  //     return SizedBox(width: 10,);
                  //   },
                  // )
                  // Row(
                  //   children: [
                  //     Container(
                  //       height: 200,
                  //       width: 200,
                  //       margin: const EdgeInsets.all(20),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.blue, width: 10 ),
                  //       ),
                  //       child: Image.asset('assets/images/metal.png'),
                  //     ),
                  //     Container(
                  //       height: 200,
                  //       width: 200,
                  //       margin: const EdgeInsets.all(20),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.blue, width: 10 ),
                  //       ),
                  //       child: Image.asset('assets/images/metal.png'),
                  //     )
                  //     // Image.asset("asests/images/metal.png",height: 100,width: 200,),
                  //     // SizedBox(width: 2,),
                  //     // Image.asset("assets/images/paper.png",height: 100,width: 200),
                  //     // SizedBox(width: 2,),
                  //     // Image.asset("assets/images/plastic.png",height: 100,width: 200)
                  //   ],
                  // )
                ),
                // FloatingActionButton(
                //   onPressed: () {
                //
                //
                //   },
                //   child: Icon(Icons.add, color: Colors.white),
                //   backgroundColor: Colors.black.withOpacity(.1),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
