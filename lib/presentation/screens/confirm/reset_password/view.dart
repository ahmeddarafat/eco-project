import 'package:eco_project/core/cache_helper.dart';

import '../../../../data/model/request_models.dart';
import '../../auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/helper_method.dart';
import '../../../../data/data_source/api_service.dart';
import '../../../../data/network/network_info.dart';
import '../../../../data/repository/repository.dart';
import '../../home/view.dart';
import '../confirmation/view.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final Repository _repo = RepositoryImpl(
    apiService: ApiService(),
    networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
  );

  bool isHiddenPassword = true;
  bool isHiddenPassword2 = true;

  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPassController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPassController.dispose();
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4A4B4D),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 130.h),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4A4B4D),
                      fontSize: 26.sp,
                    ),
                  ),
                  SizedBox(height: 17.h),
                  Text(
                    "Enter your new password and confirm the\n new password to reset password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff7C7D7E),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 130.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fillColor: const Color(0xffF2F2F2),
                        filled: true,
                        hintText: "New Password",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 20, right: 13.78),
                          child:
                              Icon(Icons.key_sharp, color: Color(0xffAFB0B6)),
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  isHiddenPassword = !isHiddenPassword;
                                },
                              );
                            },
                            child: isHiddenPassword
                                ? const Icon(Icons.visibility,
                                    color: Color(0xffCACBCE))
                                : const Icon(Icons.visibility,
                                    color: Color(0xff1E1E1E))),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xffAFB0B6),
                        ),
                      ),
                      controller: _passwordController,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Please, Enter your password";
                        } else if (password.length < 6) {
                          return "Short password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      obscureText: isHiddenPassword2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fillColor: const Color(0xffF2F2F2),
                        filled: true,
                        hintText: "Confirm New Password",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 20, right: 13.78),
                          child:
                              Icon(Icons.key_sharp, color: Color(0xffAFB0B6)),
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isHiddenPassword2 = !isHiddenPassword2;
                              });
                            },
                            child: isHiddenPassword2
                                ? const Icon(Icons.visibility,
                                    color: Color(0xffCACBCE))
                                : const Icon(Icons.visibility,
                                    color: Color(0xff1E1E1E))),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xffAFB0B6),
                        ),
                      ),
                      controller: _confirmPassController,
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return "Please, Enter your password again";
                        } else if (pass != _passwordController.text) {
                          return "The password not match";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 130.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff9DD549),
                      shadowColor: const Color(0xff9DD549),
                      fixedSize: const Size(327, 56),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // var request = ResetPassRequestModel(
                        //   // need to add correct token
                        //   token: CacheHelper.getToken(),
                        //   email: widget.email,
                        //   pass: _passwordController.text,
                        // );
                        // _repo.resetPass(request).then(
                        //   (value) {
                        //     value.fold(
                        //       (failure) {
                        //         final snackBar = SnackBar(
                        //           content: Text(failure.message),
                        //         );
                        //         ScaffoldMessenger.of(context)
                        //             .showSnackBar(snackBar);
                        //       },
                        //       (r) {
                        //         if (r.fail != null) {
                        //           final snackBar = SnackBar(
                        //             content: Text(r.fail!),
                        //           );
                        //           ScaffoldMessenger.of(context)
                        //               .showSnackBar(snackBar);
                        //         } else {
                        //           navigateTo(
                        //             page: const Confirmation(),
                        //             withHistory: false,
                        //           );
                        //         }
                        //       },
                        //     );
                        //   },
                        // );
                        navigateTo(
                          page: const Confirmation(),
                          withHistory: false,
                        );
                      }
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          color: const Color(0xffFFFFFF), fontSize: 16.sp),
                    ),
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
