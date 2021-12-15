import 'package:flutter/material.dart';
import 'package:movie_recommend/model/model.dart';
import 'package:movie_recommend/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  MovieList({Key? key}) : super(key: key);
  MovieProvider? _movieProvider;

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(child: Text(movies[index].title));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        });
  }

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider!.loadMovies();
    return Scaffold(
      body: Consumer<MovieProvider>(builder: (context, provider, widget) {
        if (provider.movies != null && provider.movies.isNotEmpty) {
          print(provider.movies[0].title);
          return _makeListView(provider.movies);
        }
        return Container(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
