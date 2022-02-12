import 'dart:async';
import 'dart:convert';

import '../config/app_config.dart';

import '../utils/api_uri.dart';

import '../models/town/town.dart';

// import '../models/town.dart';
import 'package:http/http.dart' as http;

class TownsRepository {
  Future<List<Town>> fetchTownsByWilayaId(String wilayaCode) async {
    try {
      final response = await http
          .get(
            ApiUri.getUri("/towns/$wilayaCode"),
            headers: ApiUri.getHeaders(),
          )
          .timeout(const Duration(seconds: AppConfig.requestTimeoutSeconds));

      final List<dynamic> townsJson =
          json.decode(utf8.decode(response.bodyBytes));
      final towns = townsJson.map((town) => Town.fromJson(town)).toList();
      towns.sort((a, b) {
        return a.name.compareTo(b.name);
      });
      return towns;
      // return response.data;
    } on TimeoutException {
      throw "Serveur injoignable, veuillez reéssayer ultérieurement.";
    } catch (err) {
      rethrow;
    }
  }
}
