/// A class that holds constant values for configuration purposes.
///
/// This class is meant to store constant values such as base URL and API key
/// that are required throughout the application. By centralizing these values,
/// it becomes easier to manage and update them as needed.
class Consts {
  /// Usage:
  /// ```dart
  /// Consts(
  ///   baseUrl: 'https://api.example.com',
  ///   apiKey: 'your_api_key',
  /// );
  /// ```
  const Consts({
    required this.baseUrl,
    required this.apiKey,
  });

  /// The base URL for the API endpoints.
  final String baseUrl;

  /// The API key used for authentication with the API.
  final String apiKey;
}
