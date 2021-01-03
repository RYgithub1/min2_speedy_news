import 'package:flutter/material.dart';
import 'package:min2_speedy_news/screens/home_screen.dart';
import 'package:min2_speedy_news/style/style.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPEEDY NEWS',
      theme: ThemeData(
        // brightness: Brightness.dark,
        fontFamily: BoldFont,
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
