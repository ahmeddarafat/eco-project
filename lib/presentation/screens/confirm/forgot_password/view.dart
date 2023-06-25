import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabbar_pages/tab1.dart';
import 'tabbar_pages/tab2.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff4A4B4D),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 130.h),
            Text(
              "Forgot Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff4A4B4D),
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "Enter your email or phone number, we will\nsend you verification code",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff7C7D7E),
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.h),
                    child: Container(
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: const Color(0xffF2F6FD),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: TabBar(
                              labelColor: Colors.black,
                              indicatorWeight: 2,
                              indicator: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              controller: tabController,
                              tabs: const [
                                Tab(
                                  text: 'E-mail',
                                ),
                                Tab(
                                  text: 'Mobile Number',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        Tab1(),
                        Tab2(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
