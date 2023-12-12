import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/auth/request/login_request_entreprise_model.dart';
import '../models/auth/request/login_request_user_model.dart';
import '../models/auth/request/register_request_entreprise_model.dart';
import '../models/auth/request/register_request_user_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(login_request_user_model model) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
    var url = Uri.parse(Config.API_URL + Config.API_URL_USER_LOGIN);

    var response = await client.post(url,
        headers: headers, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> loginEntreprise(login_request_entreprise_model model) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
    var url = Uri.parse(Config.API_URL + Config.API_URL_ENTREPRISE_LOGIN);

    var response = await client.post(url,
        headers: headers, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<register_request_user_model> Register(register_request_user_model model) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
    var url = Uri.parse(Config.API_URL + Config.API_URL_USER_REGISTER);

    var response = await client.post(url,
        headers: headers, body: jsonEncode(model.toJson()));
    print(response.statusCode);

    return RegisterResponseUserModelFromJson(response.body);
  }

  static Future<register_request_entreprise_model> RegisterEntreprise(register_request_entreprise_model model) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
    var url = Uri.parse(Config.API_URL + Config.API_URL_ENTREPRISE_REGISTER);

    var response = await client.post(url,
        headers: headers, body: jsonEncode(model.toJson()));
    print(response.statusCode);

    return RegisterResponseEntrepriseModelFromJson(response.body);
  }

}
