import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/offer/offer_model.dart';

class OfferService{
  static var client = http.Client();

  static Future<List<offerModel>?> getOffer() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.API_URL,
      Config.API_URL_OFFER,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return offerModelFromJson(data["data"]);

      //return true;
    } else {
      return null;
    }
  }
  static Future<List<offerModel>> SaveOffer(offerModel model) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
    var url = Uri.parse(Config.API_URL + Config.API_URL_OFFER);

    var response = await client.post(url,
        headers: headers, body: jsonEncode(model.toJson()));
    print(response.statusCode);

    return offerModelFromJson(response.body);
  }



}