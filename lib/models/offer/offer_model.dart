
List<offerModel> offerModelFromJson(dynamic str) =>
    List<offerModel>.from((str).map((x) => offerModel.fromJson(x)));

class offerModel {
  String? id;
  String? title;
  String? company;
  String? place;
  int? duration;
  bool? paid;
  String? img;

  offerModel(
      {this.id,
        this.title,
        this.company,
        this.place,
        this.duration,
        this.paid,
        this.img});

  offerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    company = json['company'];
    place = json['place'];
    duration = json['duration'];
    paid = json['paid'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['company'] = this.company;
    data['place'] = this.place;
    data['duration'] = this.duration;
    data['paid'] = this.paid;
    data['img'] = this.img;
    return data;
  }
}
