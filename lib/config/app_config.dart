// import 'dart:io' show Platform;

class AppConfig {
  // dev config
  // static const String apiProtocol = "http";
  // static final String apiHost = Platform.isAndroid
  //     ? "10.0.2.2"
  //     : "127.0.0.1"; // alias of 127.0.0.1 for AVD
  // static const String apiProtocol = "http";
  // static const int? apiPort = 8000;

  static const String apiProtocol = "https";
  static const String apiHost = "water-schedule.herokuapp.com";
  static const String? apiVersion = "v1";
  static const int? apiPort = null;

  static const int requestTimeoutSeconds = 15;
}
