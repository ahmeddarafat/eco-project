import 'dart:developer';

import 'package:eco_project/core/cache_helper.dart';
import 'package:eco_project/core/helper_method.dart';
import 'package:eco_project/data/model/request_models.dart';
import 'package:eco_project/presentation/screens/confirm/confirmation/view.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../data/data_source/api_service.dart';
import '../../../../data/network/network_info.dart';
import '../../../../data/repository/repository.dart';
import 'confrimation.dart';

class Promocode extends StatefulWidget {
  final bool showDialog;
  const Promocode({
    super.key,
    this.showDialog = false,
  });

  @override
  State<Promocode> createState() => _PromocodeState();
}

class _PromocodeState extends State<Promocode> {
  final Repository _repo = RepositoryImpl(
    apiService: ApiService(),
    networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
  );

  late final TextEditingController _promoCodeController;
  final GlobalKey<FormState> _formKey = GlobalKey();

  String userName = "";
  int points = 0;

  @override
  void initState() {
    super.initState();

    _promoCodeController = TextEditingController();

    userName = CacheHelper.getName();
    points = CacheHelper.getCounter();

    Future.delayed(
      Duration.zero,
      () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Promo Code",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff1E1E1E))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Type in ECO’s promo code and collect your points",
                        style:
                            TextStyle(fontSize: 11, color: Color(0xff969796))),
                    const SizedBox(
                      height: 28,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "app.Recipe.co/jollof_rice",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9DD549),
                          ),
                        ),
                      ),
                      controller: _promoCodeController,
                      validator: (code) {
                        if (code!.isEmpty) {
                          return "Please, Enter the promo code";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final request = PromoCodeRequestModel(
                            promoCode: _promoCodeController.text,
                            token: CacheHelper.getToken(),
                          );
                          _repo.promoCode(request).then(
                            (value) {
                              value.fold(
                                (failure) {
                                  log("failure");
                                  final snackBar = SnackBar(
                                    content: Text(failure.message),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                (responseModel) {
                                  log("success");
                                  if (responseModel.fail != null) {
                                    String errorMessage = "The code is wrong";
                                    SnackBar snackBar = SnackBar(
                                      content: Text(errorMessage),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    CacheHelper.saveCounter(
                                      (int.parse(responseModel.points ?? "0") +
                                          CacheHelper.getCounter()),
                                    );
                                    navigateTo(page: const ConfirmationCode());
                                  }
                                },
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(170, 50),
                          backgroundColor: const Color(0xff9DD549),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Earn now",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
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
