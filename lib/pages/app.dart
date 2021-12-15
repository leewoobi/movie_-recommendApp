import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommend/components/genreToString.dart';
import 'package:movie_recommend/components/mainMovieCon.dart';
import 'package:movie_recommend/components/movieCon.dart';
import 'package:movie_recommend/pages/detail.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  double width = Get.width;
  double height = Get.height;
  List pouplarMovies = [];
  List topMovies = [];
  List nowPlayingMovies = [];
  List commingMovies = [];

  Widget MainContMovieList() {
    return Container(
      child: Column(
        children: const [],
      ),
    );
  }

  final String apiKey = 'd01c4011707d27df2017395a710a4dae';
  final accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMDFjNDAxMTcwN2QyN2RmMjAxNzM5NWE3MTBhNGRhZSIsInN1YiI6IjYxYjk2ZDBjYTNkMDI3MDA0MzEwMTViMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S5jBvRowKbDpENYRPckR3zft552VuiKPE3UESYns-nY';
  @override
  void initState() {
    loadMovie();
    super.initState();
  }

  loadMovie() async {
    TMDB tmdbWithCoustomLogs = TMDB(ApiKeys(apiKey, accessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map pouplarMovie = await tmdbWithCoustomLogs.v3.movies.getPouplar(); // 인기
    Map topMovie = await tmdbWithCoustomLogs.v3.movies.getTopRated(); // 높은 평점
    Map nowPlaying =
        await tmdbWithCoustomLogs.v3.movies.getNowPlaying(); // 현재상영중
    Map commingMovie =
        await tmdbWithCoustomLogs.v3.movies.getUpcoming(); // 개봉예정

    setState(() {
      nowPlayingMovies = nowPlaying['results'];
      commingMovies = commingMovie['results'];
      pouplarMovies = pouplarMovie['results'];
      topMovies = topMovie['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                MainMoviesContents(movies: nowPlayingMovies, title: '현재상영중'),
                MoviesContents(movies: commingMovies, titles: '개봉 예정'),
                MoviesContents(movies: pouplarMovies, titles: '인기'),
                MoviesContents(movies: topMovies, titles: '높은 평점')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
