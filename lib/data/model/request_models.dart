class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "full_name": name,
      "email": email,
      'password': password,
      "confirm_password": confirmPassword,
    };
  }
}

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      'password': password,
    };
  }
}

class ForgotPassRequestModel {
  final String email;

  ForgotPassRequestModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}

class ResetPassRequestModel {
  final String token;
  final String email;
  final String pass;

  ResetPassRequestModel({
    required this.token,
    required this.email,
    required this.pass,
  });

  Map<String, dynamic> toJson() {
    return {
      "reset_token": token,
      "email": email,
      "new_password": pass,
    };
  }
}

class PromoCodeRequestModel {
  final String token;
  final String promoCode;

  PromoCodeRequestModel({
    required this.token,
    required this.promoCode
  });

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "promo_code" :promoCode,
    };
  }
}
