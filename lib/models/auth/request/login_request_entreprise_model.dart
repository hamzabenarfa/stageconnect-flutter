import 'dart:convert';
login_request_entreprise_model loginResponseEntrepriseModelFromJson(String str) =>
    login_request_entreprise_model.fromJson(json.decode(str));

class login_request_entreprise_model {
  String? email;
  String? password;


  login_request_entreprise_model({this.email, this.password});

  login_request_entreprise_model.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
