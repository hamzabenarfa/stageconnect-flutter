import 'dart:convert';

register_request_user_model RegisterResponseUserModelFromJson(String str) =>
    register_request_user_model.fromJson(json.decode(str));


class register_request_user_model {
  String? email;
  String? password;
  String? nom;
  String? prenom;
  String? role;

  register_request_user_model(
      {this.email, this.password, this.nom, this.prenom, this.role});

  register_request_user_model.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    nom = json['nom'];
    prenom = json['prenom'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['role'] = this.role;
    return data;
  }
}
