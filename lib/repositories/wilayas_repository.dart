import 'dart:async';
import 'dart:convert';

import '../config/app_config.dart';

import '../utils/api_uri.dart';

import '../models/wilaya/wilaya.dart';

import 'package:http/http.dart' as http;

class WilayasRepository {
  Future<List<Wilaya>> fetchAllWilayas() async {
    try {
      final response = await http
          .get(
            ApiUri.getUri("wilayas"),
            headers: ApiUri.getHeaders(),
          )
          .timeout(const Duration(seconds: AppConfig.requestTimeoutSeconds));

      final List<dynamic> wilayasJson =
          json.decode(utf8.decode(response.bodyBytes));
      final wilayas =
          wilayasJson.map((wilaya) => Wilaya.fromJson(wilaya)).toList();
      return wilayas;
      // return response.data;
    } catch (err) {
      if (err is TimeoutException) {
        throw "Serveur injoignable, veuillez reéssayer ultérieurement.";
      } else {
        rethrow;
      }
    }
  }
}
