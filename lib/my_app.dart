import 'package:flutter/material.dart';
import 'package:movie_app/api.dart';
import 'package:movie_app/movie.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    final movies = await Api.getPopularMovies();
    setState(() {
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas populares',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Películas populares'),
        ),
        body: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            final movie = _movies[index];
            return ListTile(
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w92${movie.posterPath}'),
              title: Text(movie.title),
              subtitle: Text(movie.overview),
            );
          },
        ),
      ),
    );
  }
}
