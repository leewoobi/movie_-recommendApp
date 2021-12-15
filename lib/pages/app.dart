import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:tmdb_api/tmdb_api.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List pouplarMovies = [];
  List topMovies = [];
  List nowPlayingMovies = [];
  List commingMovies = [];

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
      pouplarMovies = pouplarMovie['results'];
      topMovies = topMovie['results'];
      nowPlayingMovies = nowPlaying['results'];
      commingMovies = commingMovie['results'];
    });
    print(pouplarMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500' +
                      pouplarMovies[0]['poster_path']),
                ),
              ),
              height: 200,
            ),
            Container(
              child: Text('개봉예정'),
            ),
            Container(
              child: Text('인기'),
            ),
            Container(
              child: Text('높은 평줨'),
            )
          ],
        ),
      ),
    );
  }
}
