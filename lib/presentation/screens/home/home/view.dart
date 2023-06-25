import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: (EdgeInsets.only(
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
                          "Hi, AboNassim!",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff9DD549)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Let’s contribute to our earth.",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff969796))),
                      ],
                    )
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
                          const Text("000",
                              style: TextStyle(
                                  color: Color(0xffFFFFFF), fontSize: 20)),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text("SAVED co2",
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
      )),
    );
  }
}
