import 'package:flutter/material.dart';
import 'package:min2_speedy_news/style.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPEEDY NEWS',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: BoldFont,
        // primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'SPEEDY NEWS'),
    );
  }
}
