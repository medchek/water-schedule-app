import 'dart:async';
import 'dart:convert';

import '../config/app_config.dart';

import '../utils/enums.dart';

import '../utils/api_uri.dart';

import '../models/schedule/schedule.dart';

// import '../models/town.dart';
import 'package:http/http.dart' as http;

/// resolves to null if the schedule was not found (404), otherwise resolve with a Schedule object
///
/// throws an error when encountering any other error.
class ScheduleRepository {
  Future<Schedule?> fetchSchedule(
      {required int townCode, required TargetSchedule targetSchedule}) async {
    final String target =
        targetSchedule == TargetSchedule.current ? "current" : "next";

    try {
      final response = await http
          .get(
            ApiUri.getUri("/schedules/$townCode/$target"),
            headers: ApiUri.getHeaders(),
          )
          .timeout(const Duration(seconds: AppConfig.requestTimeoutSeconds));

      switch (response.statusCode) {
        case 404:
          return null;
        case 200:
          final schedule = Schedule.fromJson(json.decode(response.body));
          return schedule;
        default:
          return null;
      }
    } catch (err) {
      rethrow;
    }
  }
}
