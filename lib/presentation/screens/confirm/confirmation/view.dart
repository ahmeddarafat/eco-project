import 'package:eco_project/core/helper_method.dart';
import 'package:eco_project/presentation/screens/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 215.h),
              Image.asset(
                "assets/images/app_logo.png",
                height: 223.h,
                width: 293.w,
              ),
              SizedBox(height: 44.h),
              Text(
                "Confirmation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff1E1E1E),
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 44.sp),
              Text(
                "Your password has been changed. Please\n log in with your new password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff1E1E1E),
                  fontSize: 14.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 44.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xff9DD549),
                    shadowColor: const Color(0xff9DD549),
                    fixedSize: const Size(327, 56),
                  ),
                  onPressed: () {
                    navigateTo(page: const LoginScreen(), withHistory: false);
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontSize: 16.sp,
                    ),
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
