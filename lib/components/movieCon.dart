import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_recommend/components/genreToString.dart';
import 'package:movie_recommend/utils/colors.dart';

class MoviesContents extends StatelessWidget {
  const MoviesContents({required this.movies, required this.titles, Key? key})
      : super(key: key);

  final List movies;
  final String titles;

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
                child: Text(
                  titles,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontFamily: 'NotoSans'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                              width: width * 0.20,
                              height: height * 0.14,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500' +
                                      movies[index]['poster_path'],
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: height * 0.14,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movies[index]['title']),
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
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        genreToString(
                                          movies[index]['genre_ids'],
                                        ),
                                        style:
                                            TextStyle(color: ColorsFS.grayText),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                      ),
                                    ),
                                    Text(
                                      movies[index]['release_date'],
                                      style:
                                          TextStyle(color: ColorsFS.grayText),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
