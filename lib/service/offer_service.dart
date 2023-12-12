import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/offer/offer_model.dart';

class OfferService{
  static var client = http.Client();


  static Future<List<offerModel>?> getOffer() async {
    final String apiUrl = "http://10.0.2.2:8080/api/offre";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {

        List<offerModel> data = (json.decode(response.body) as List<dynamic>)
            .map((jsonObject) => offerModel.fromJson(jsonObject))
            .toList();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle any errors that occurred during the fetch
      print('Error: $error');
      rethrow;
    }
  }
  static Future<List<offerModel>?> SaveOffer(offerModel model) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(Config.API_URL + Config.API_URL_OFFER);

      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(model.toJson()),
      );

      print('HTTP Response Code: ${response.statusCode}');

      if (response.statusCode == 201) {
        // Parse the JSON string into a Map
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Convert the Map into an offerModel
        offerModel offer = offerModelFromJson(jsonEncode(jsonResponse)) as offerModel;

        // Return a List with the single offerModel
        return [offer];
      } else {
        // Handle non-201 status codes
        print('Failed to save offer. Status Code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle network or other errors
      print('Error saving offer: $e');
      return null;
    }
  }

  static Future<void> deleteOffer(String offerId) async {
    final String apiUrl = "http://10.0.2.2:8080/api/offre/$offerId";

    try {
      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 204) {
        // Successfully deleted
        print('Offer deleted successfully');
      } else {
        throw Exception('Failed to delete offer. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occurred during the delete
      print('Error deleting offer: $error');
      rethrow;
    }
  }

  static Future<List<offerModel>?> updateOffer(String offerId,offerModel model) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var url = Uri.parse("${Config.API_URL}${Config.API_URL_OFFER}/${offerId}");

      print(url);
      var response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(model.toJson()),
      );

      print('HTTP Response Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        offerModel offer = offerModel.fromJson(jsonResponse);
        return [offer];
      } else {
        print('Failed to update offer. Status Code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error updating offer: $e');
      return null;
    }
  }


}

