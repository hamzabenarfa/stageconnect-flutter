import 'dart:convert';

register_request_entreprise_model RegisterResponseEntrepriseModelFromJson(String str) =>
    register_request_entreprise_model.fromJson(json.decode(str));

class register_request_entreprise_model {
  String? nom;
  String? email;
  String? adresse;
  String? password;
  bool? status;

  register_request_entreprise_model(
      {this.nom, this.email, this.adresse, this.password, this.status});

  register_request_entreprise_model.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    email = json['email'];
    adresse = json['adresse'];
    password = json['password'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['email'] = this.email;
    data['adresse'] = this.adresse;
    data['password'] = this.password;
    data['status'] = this.status;
    return data;
  }
}

