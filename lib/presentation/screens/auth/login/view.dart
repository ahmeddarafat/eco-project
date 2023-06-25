import 'package:eco_project/core/cache_helper.dart';

import '../../../../core/helper_method.dart';
import '../register/view.dart';
import '../../home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../data/data_source/api_service.dart';
import '../../../../data/model/request_models.dart';
import '../../../../data/network/network_info.dart';
import '../../../../data/repository/repository.dart';
import '../../confirm/forgot_password/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Repository _repo = RepositoryImpl(
    apiService: ApiService(),
    networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
  );

  final GlobalKey<FormState> _formKey = GlobalKey();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hello,',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff9DD549),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome Back 👋',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Let’s log in',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(
                            0xff1E1E1E,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
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
                    SizedBox(height: 20.h),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      obscureText: true,
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
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Please, Enter your password";
                        } else if (password.length < 6) {
                          return "Short password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
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
                          final request = LoginRequestModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          _repo.login(request).then(
                            (response) {
                              response.fold(
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
                                    CacheHelper.saveName(
                                        responseModel.name ?? "");
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
                      child: const Text(
                        "Log In",
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextButton(
                      onPressed: () {
                        navigateTo(page: const ForgotPasswordPage());
                      },
                      style: const ButtonStyle(),
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 35.h),
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
                    SizedBox(height: 20.h),
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
                          "Haven’t an account?",
                          style: TextStyle(
                            color: const Color(0xffBDBEC2),
                            fontSize: 16.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(page: const RegisterScreen());
                          },
                          style: const ButtonStyle(),
                          child: Text(
                            "Register",
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
      ),
    );
  }
}
