import 'package:flutter/material.dart';
import 'package:movie_recommend/pages/app.dart';
import 'package:movie_recommend/pages/test.dart';
import 'package:movie_recommend/provider/movies_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider())
        ],
        child: App(),
      ),
    );
  }
}
