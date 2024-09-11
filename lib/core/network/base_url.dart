const String _baseUrl = 'https://api.thecatapi.com/v1';

class BaseUrl {
  static String getAllCats = '$_baseUrl/breeds';
  static String searchCats = '$_baseUrl/breeds/search/';
  static String getCatImage = '$_baseUrl/images/{referenceImageId}';
}
