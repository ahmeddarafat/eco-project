import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper_method.dart';
import '../reset_password/view.dart';

class VerifyCode extends StatelessWidget {
  final EmailOTP myauth;
  final String? email;
  VerifyCode({Key? key, required this.myauth, this.email}) : super(key: key);

  late final String? _code;
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 126),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Verify Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4A4B4D),
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 17.h),
                const Text(
                  "Enter your verification code from your email\n or phone number that we’ve sent",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff7C7D7E),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 120.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpTextField(
                      numberOfFields: 4,
                      textStyle: const TextStyle(
                        color: Color(0xff9DD549),
                      ),
                      focusedBorderColor: const Color(0xff9DD549),
                      showFieldAsBox: true,
                      fieldWidth: 52,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xff9DD549),
                          ),
                        ),
                        fillColor: const Color(0xffF2F2F2),
                        filled: true,
                      ),
                      onSubmit: (value) {
                        _code = value;
                        log(_code ?? "null");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 120.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xff9DD549),
                    shadowColor: const Color(0xff9DD549),
                    fixedSize: const Size(327, 56),
                  ),
                  onPressed: () async {
                    if (await myauth.verifyOTP(otp: _code) == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("OTP is verified"),
                        ),
                      );
                      navigateTo(
                        page: ResetPassword(email: email ?? ""),
                        withHistory: true,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid OTP"),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(
                        color: const Color(0xffFFFFFF), fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
