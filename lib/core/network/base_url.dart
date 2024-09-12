const String _baseUrl = 'https://api.thecatapi.com/v1';

/// Contains base URLs and endpoints for the Cat API.
class BaseUrl {
  /// URL to get all cat breeds.
  static String get getAllCats => '$_baseUrl/breeds';

  /// URL to search for cat breeds.
  static String get searchCats => '$_baseUrl/breeds/search/';
}
