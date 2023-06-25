import 'dart:developer';

import '../../../../core/cache_helper.dart';
import '../../../../data/data_source/api_service.dart';
import '../../../../data/model/request_models.dart';
import '../../../../data/network/network_info.dart';
import '../../../../data/repository/repository.dart';
import '../../home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/helper_method.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Repository _repo = RepositoryImpl(
    apiService: ApiService(),
    networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
  );

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPassWordController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPassWordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 45.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios, size: 20.sp),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: const Color(0xff9DD549),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Registration 👍',
                      style: TextStyle(fontSize: 24.sp, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Let’s Register.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff1E1E1E),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9DD549),
                          ),
                        ),
                      ),
                      controller: _nameController,
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Please, Enter your name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.sp),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.mail_outline),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9DD549),
                          ),
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
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: TextFormField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.key_off_outlined),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9DD549),
                          ),
                        ),
                      ),
                      controller: _passwordController,
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Please, Enter your Password";
                        } else if (name.length < 6) {
                          return "Please, Enter long Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.key_off_outlined),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9DD549),
                          ),
                        ),
                      ),
                      controller: _confirmPassWordController,
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
                  SizedBox(height: 25.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: const Color(0xff9DD549),
                      fixedSize: const Size(352, 50),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final request = RegisterRequestModel(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPassWordController.text,
                        );
                        _repo.register(request).then(
                          (value) {
                            value.fold(
                              (failure) {
                                final snackBar = SnackBar(
                                  content: Text(failure.message),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              (responseModel) {
                                if (responseModel.fail != null) {
                                  final snackBar = SnackBar(
                                    content: Text(responseModel.fail!),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  CacheHelper.saveName(_nameController.text);
                                  CacheHelper.saveToken(
                                      responseModel.token ?? "");
                                  navigateTo(
                                      page: const HomeView(),
                                      withHistory: false);
                                }
                              },
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: const Color(0xffFFFFFF), fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 1,
                        width: 90.h,
                        color: const Color(0xffAFB0B6),
                      ),
                      Text(
                        "Or continue with",
                        style: TextStyle(
                          color: const Color(0xffAFB0B6),
                          fontSize: 16.sp,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 90.h,
                        color: const Color(0xffAFB0B6),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/google2.png",
                        height: 100.w,
                        width: 100.w,
                      ),
                      Image.asset(
                        "assets/images/apple2.png",
                        height: 100.w,
                        width: 100.w,
                      ),
                      Image.asset(
                        "assets/images/facebook2.png",
                        height: 100.w,
                        width: 100.w,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(
                            color: const Color(0xffBDBEC2), fontSize: 16.sp),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: const ButtonStyle(),
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
