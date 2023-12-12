import 'dart:convert';

login_response_user_model loginResponseUserModelFromJson(String str) =>
    login_response_user_model.fromJson(json.decode(str));

class login_response_user_model {
  String? id;
  Null? nom;
  Null? prenom;
  String? email;
  String? password;
  Null? role;

  login_response_user_model(
      {this.id, this.nom, this.prenom, this.email, this.password, this.role});

  login_response_user_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}
