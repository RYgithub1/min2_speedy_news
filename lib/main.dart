import 'package:flutter/material.dart';
import 'package:min2_speedy_news/style/style.dart';
import 'package:min2_speedy_news/view/screens/home_screen.dart';
import 'package:min2_speedy_news/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider<NewsListViewModel>(
      create: (context) => NewsListViewModel(),
      child: MyApp(),
    ),
  );
}



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
