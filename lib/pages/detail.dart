import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_recommend/components/genreToString.dart';
import 'package:movie_recommend/pages/app.dart';
import 'package:movie_recommend/utils/colors.dart';

class DetailContView extends StatefulWidget {
  const DetailContView({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  _DetailContViewState createState() => _DetailContViewState();
}

class _DetailContViewState extends State<DetailContView> {
  @override
  Widget isAdult(bool adult) {
    if (adult) {
      return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          'Adult',
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'all ages',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      child: Opacity(
                        opacity: 0.60,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500' +
                              widget.data['poster_path'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 550,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 20,
                                    right: 70,
                                    child: SizedBox(
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                widget.data['title'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                              )),
                                          isAdult(widget.data['adult']),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              genreToString(
                                                  widget.data['genre_ids']),
                                              style: TextStyle(
                                                  color: ColorsFS.grayText),
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ),
                                          Text(
                                            widget.data['release_date'] +
                                                '  발매',
                                            style: TextStyle(
                                                color: ColorsFS.grayText),
                                          ),
                                          Row(
                                            children: [
                                              RatingBar.builder(
                                                itemSize: 15,
                                                initialRating: widget
                                                        .data['vote_average'] /
                                                    2,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              Text(
                                                widget.data['vote_average']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.amber),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 140,
                      left: 20,
                      child: SizedBox(
                        width: 140,
                        height: 220,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500' +
                                widget.data['poster_path'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 400,
                        left: 20,
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                '개요',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.data['overview'],
                                style: TextStyle(color: ColorsFS.grayText),
                                overflow: TextOverflow.fade,
                                maxLines: 3,
                                softWrap: true,
                              ),
                            ),
                          ],
                        )))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
