import '../../../../../data/model/request_models.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/helper_method.dart';
import '../../../../../data/data_source/api_service.dart';
import '../../../../../data/network/network_info.dart';
import '../../../../../data/repository/repository.dart';
import '../../verify_code/view.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  final Repository _repo = RepositoryImpl(
    apiService: ApiService(),
    networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
  );

  final GlobalKey<FormState> _formKey = GlobalKey();

  late final TextEditingController _emailController;

  EmailOTP myauth = EmailOTP();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: const Color(0xffF2F2F2),
                filled: true,
                hintText: "E-mail",
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 13.78),
                  child: Icon(Icons.mail_outline_outlined,
                      color: Color(0xffAFB0B6)),
                ),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffAFB0B6),
                ),
              ),
              controller: _emailController,
              validator: (email) {
                if (email!.isEmpty) {
                  return "Please, Enter your email";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 164.h),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xff9DD549),
                shadowColor: const Color(0xff9DD549),
                fixedSize: const Size(327, 56),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final request = ForgotPassRequestModel(
                    email: _emailController.text,
                  );
                  _repo.forgotPass(request).then(
                    (value) {
                      value.fold(
                        (failure) {
                          final snackBar = SnackBar(
                            content: Text(failure.message),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        (r) {
                          if (r.fail != null) {
                            final snackBar = SnackBar(
                              content: Text(r.fail!),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            // sending code
                            myauth.setConfig(
                              appEmail: "AT@gmail.com",
                              appName: "Eco",
                              userEmail: _emailController.text,
                              otpLength: 4,
                              otpType: OTPType.digitsOnly,
                            );
                            myauth.sendOTP();

                            navigateTo(
                              page: VerifyCode(myauth: myauth,email: _emailController.text),
                              withHistory: true,
                            );
                          }
                        },
                      );
                    },
                  );
                }
              },
              child: const Text(
                "Send code",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // helper methods
}
