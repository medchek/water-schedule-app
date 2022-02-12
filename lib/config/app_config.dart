import 'dart:io' show Platform;

class AppConfig {
  static const String apiProtocol = "http";
  static final String apiHost = Platform.isAndroid
      ? "10.0.2.2"
      : "127.0.0.1"; // alias of 127.0.0.1 for AVD
  // static const String apiHost = "seaal-water-schedule.test";
  static const String? apiVersion = "v1";
  static const int? apiPort = 8000;
  // static const int? apiPort = 443;

  static const int requestTimeoutSeconds = 10;
}
