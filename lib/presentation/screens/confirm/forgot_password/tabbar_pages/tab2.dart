import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../core/helper_method.dart';
import '../../verify_code/view.dart';

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: IntlPhoneField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: const Color(0xffF2F2F2),
                    filled: true,
                    hintText: "Mobile Number",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 13.78),
                      child: Icon(Icons.mail_outline_outlined),
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffAFB0B6),
                    )),
              ),
            ),
            SizedBox(height: 164.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  // testing EmailOTP 
                  // maybe not working because new instance
                  navigateTo(
                    page: VerifyCode(myauth: EmailOTP()),
                    withHistory: true,
                  );
                },
                child: const Text(
                  "Send code",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
