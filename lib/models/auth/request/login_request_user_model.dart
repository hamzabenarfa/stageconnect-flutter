import 'dart:convert';

login_request_user_model loginResponseUserModelFromJson(String str) =>
    login_request_user_model.fromJson(json.decode(str));


class login_request_user_model {
  String? email;
  String? password;
  String? role;

  login_request_user_model({this.email, this.password, this.role});

  login_request_user_model.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}
