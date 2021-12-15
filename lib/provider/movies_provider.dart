import 'package:flutter/material.dart';

import 'package:movie_recommend/model/model.dart';
import 'package:movie_recommend/repository/movieRepository.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;
  loadMovies() async {
    List<Movie>? listMovies = await _movieRepository.loadMovies();
    _movies = listMovies!;
    notifyListeners();
  }

  clearMovies() {
    _movies.clear();
  }
}
