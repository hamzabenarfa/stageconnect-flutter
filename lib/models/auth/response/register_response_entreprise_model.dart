class register_response_entreprise_model {
  String? id;
  Null? nom;
  String? email;
  Null? adresse;
  String? password;
  String? role;
  bool? status;

  register_response_entreprise_model(
      {this.id,
        this.nom,
        this.email,
        this.adresse,
        this.password,
        this.role,
        this.status});

  register_response_entreprise_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    email = json['email'];
    adresse = json['adresse'];
    password = json['password'];
    role = json['role'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['email'] = this.email;
    data['adresse'] = this.adresse;
    data['password'] = this.password;
    data['role'] = this.role;
    data['status'] = this.status;
    return data;
  }
}
