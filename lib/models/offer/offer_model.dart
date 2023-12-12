List<offerModel> offerModelFromJson(dynamic str) =>
    List<offerModel>.from((str).map((x) => offerModel.fromJson(x)));

class offerModel {
  String? id;
  String? title;
  String? company;
  String? place;

  offerModel({
    this.id,
    this.title,
    this.company,
    this.place,
  });

  offerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    company = json['company'];
    place = json['place'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['company'] = this.company;
    data['place'] = this.place;

    return data;
  }
}
