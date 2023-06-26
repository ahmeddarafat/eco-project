class ResponseModel {
  String? success;
  String? fail;
  String? token;
  int? points;
  String? name;

  ResponseModel({this.success, this.fail});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['message'];
    fail = json['error'];
    token = json['token'];
    points = json['points'] ?? 0;
    name = json['name'];
  }
}

