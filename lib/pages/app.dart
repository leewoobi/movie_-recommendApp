import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommend/components/genreToString.dart';
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
    print('개봉예정');
    print(genreToString(commingMovies[0]['genre_ids']));
    print(commingMovies[0]);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 10, bottom: 16),
                      child: Text(
                        '현재 상영중',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            fontFamily: 'NotoSans'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                      height: height * 0.37,
                      // color: Colors.blueGrey,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: pouplarMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return DetailContView(
                                      data: pouplarMovies[index]);
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: SizedBox(
                                  width: width * 0.37,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 154,
                                        height: height * 0.27,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500' +
                                                pouplarMovies[index]
                                                    ['poster_path'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(pouplarMovies[index]['title'],
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 10,
                                        initialRating: pouplarMovies[index]
                                                ['vote_average'] /
                                            2,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                ),
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
