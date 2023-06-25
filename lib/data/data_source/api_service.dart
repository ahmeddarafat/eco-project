import 'package:dio/dio.dart';

class DataConstants {
  /// base url
  static const String baseUrl = "https://eginternationalsteel.com/api";

  /// endpoints
  static const String register = "/register";
  static const String login = "/login";
  static const String resetPassword = "/reset_password";
  static const String forgotPassword = "/forgot_password";
  static const String promoCode = "/promo_code";

  /// headers
  static const String contentType = "content-type";
  static const String applicationJson = "application/json";
  static const String accept = "accept";
}

class ApiService {
  final Dio _dio;

  static Map<String, String> headers = {
    DataConstants.contentType: DataConstants.applicationJson,
    DataConstants.accept: DataConstants.applicationJson,
  };

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: DataConstants.baseUrl,
            headers: headers,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(milliseconds: 3600),
            receiveTimeout: const Duration(milliseconds: 3600),
          ),
        );

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(
      url,
      queryParameters: query,
    );
  }

    Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }
}


// [6/24/2023 5:04 PM] احمد الموجي 👩‍💻: https://eginternationalsteel.com/api/register

// https://eginternationalsteel.com/api/login

// https://eginternationalsteel.com/api/forgot_password

// https://eginternationalsteel.com/api/reset_password

// https://eginternationalsteel.com/api/promo_code
// [6/24/2023 5:04 PM] احمد الموجي 👩‍💻: الريكوستات ليهم بتتبعت عن طريق POST request و JSON data
// [6/24/2023 5:05 PM] احمد الموجي 👩‍💻: Backend

// Register API Endpoint: /api/register
// Endpoint description: 
// This endpoint is responsible of registering new users to our platform.

// Request type: POST
// Expected request content:

// Attribute            Type            Required                 Description
// full_name            string           True                     Full name of the new user.
// email                string           True                     E-mail address of the new user.
// password             string           True                     Password for the new user.
// confirm_password             string           True             Repeat password for the new user.








// Response:

// Success: {"message": "User has been successfully created."}
// Fail: {"error": "There are one or more inputs wrong in the sent request."}
// [6/24/2023 5:05 PM] احمد الموجي 👩‍💻: Backend

// Register API Endpoint: /api/login
// Endpoint description: 
// This endpoint is responsible of logging existing users into our platform.

// Request type: POST
// Expected request content:

// Attribute            Type            Required                 Description
// email                string           True                     E-mail address of the existing user.
// password             string           True                     Password of the existing user.







// Response:

// Success: {"message": "User logged in successfully.", "token": API_TOKEN}
// Fail: {"error": "Invalid e-mail or password."}
// [6/24/2023 5:05 PM] احمد الموجي 👩‍💻: Backend

// Register API Endpoint: /api/forgot_password
// Endpoint description: 
// This endpoint is responsible of sending password reset instructions to an existing user's e-mail.

// Request type: POST
// Expected request content:

// Attribute            Type            Required                 Description
// email                string           True                     E-mail address of the existing user.







// Response:

// Success: {"message": "Reset instructions has been sent to your e-mail address."}
// Fail: {"error": "The e-mail address provided doesn't exist in our system."}
// [6/24/2023 5:05 PM] احمد الموجي 👩‍💻: Backend

// Register API Endpoint: /api/reset_password
// Endpoint description: 
// This endpoint is responsible of resetting an existing user's password based on his request.

// Request type: POST
// Expected request content:

// Attribute            Type            Required                 Description
// reset_token          string           True                     Reset token sent to the user's e-mail address.
// email                string           True                     E-mail address of the existing user.
// new_password         string           True                     New password for the existing user.







// Response:

// Success: {"message": "Password has been reset successfully."}
// Fail: {"error": "Invalid token."}  or {"error": "Invalid e-mail or password."}
// [6/24/2023 5:05 PM] احمد الموجي 👩‍💻: Backend

// Register API Endpoint: /api/promo_code
// Endpoint description: 
// This endpoint is responsible of validating promo codes and giving points to the user accordingly.

// Request type: POST
// Expected request content:

// Attribute            Type            Required                 Description
// promo_code          string           True                     Promo code to be redeemed.
// token               string           True                    API token of the user.







// Response:

// Success: {"message": "Valid promo code.", "points": POINTS_NUMBER}
// Fail: {"error": "Invalid token."}  or {"error": "Invalid promo code."}
