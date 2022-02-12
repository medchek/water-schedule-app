import '../config/app_config.dart';

class ApiUri {
  /// Generates the api Uri object bosed on the AppConfig
  static Uri getUri(String path) {
    final resolvedPath = path.startsWith("/") ? path.substring(1) : path;

    /// set the prefix of the api route if it's not null in the AppConfig
    const prefix =
        AppConfig.apiVersion != null ? "/api/${AppConfig.apiVersion}" : "/api";

    return Uri(
      scheme: AppConfig.apiProtocol,
      host: AppConfig.apiHost,
      port: AppConfig.apiPort,
      path: "$prefix/$resolvedPath",
    );
  }

  static Map<String, String> getHeaders() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }
}
