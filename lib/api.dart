import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/movie.dart';

class Api {
  static const _apiKey = '4aa63718bd93924eb298b8d3067cef8d';
  static const _baseUrl = 'https://api.themoviedb.org/3/movie';

  static Future<List<Movie>> getPopularMovies() async {
    final response =
        await http.get('$_baseUrl/popular?api_key=$_apiKey' as Uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Movie> movies = List<Movie>.from(
          data['results'].map((movie) => Movie.fromJson(movie)));
      return movies;
    } else {
      throw Exception('Fallo al cargar los datos');
    }
  }
}
