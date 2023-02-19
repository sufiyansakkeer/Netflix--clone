import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndClass {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";
}
