import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_recommend/components/genreToString.dart';
import 'package:movie_recommend/pages/detail.dart';
import 'package:movie_recommend/utils/textSt.dart';

class MainMoviesContents extends StatelessWidget {
  const MainMoviesContents(
      {required this.movies, required this.title, Key? key})
      : super(key: key);

  final List movies;
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, bottom: 16),
                child: Text(title, style: FontST.titleLarge),
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
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return DetailContView(data: movies[index]);
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500' +
                                          movies[index]['poster_path'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(movies[index]['title'],
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: FontST.titleMid),
                                SizedBox(
                                  height: 4,
                                ),
                                RatingBar.builder(
                                  itemSize: 10,
                                  initialRating:
                                      movies[index]['vote_average'] / 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
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
        ],
      ),
    );
  }
}
