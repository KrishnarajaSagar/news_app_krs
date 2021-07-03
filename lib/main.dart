import 'package:flutter/material.dart';
import 'package:news_api_app/views/home_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Newsed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        accentColor: const Color(0xFFbf616a),
        appBarTheme: AppBarTheme(
          color: const Color(0xFF3b4252),
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xFFeceff4)),
          textTheme: TextTheme(
            headline6: kHeaderTextStyle,
          ),
        ),
        backgroundColor: const Color(0xFF3b4252),
        scaffoldBackgroundColor: const Color(0xFF3b4252),
      ),
      home: HomeScreen(),
    );
  }
}

//API key - 26bc54f37fb14b758d73708b37a0c8d3
/*
0xFF2e3440
0xFF3b4252
0xFF434c5e
0xFF4c566a
 */
