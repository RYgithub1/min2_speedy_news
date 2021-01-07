import 'package:flutter/material.dart';
import 'package:min2_speedy_news/style/style.dart';
import 'package:min2_speedy_news/view/screens/home_screen.dart';
import 'package:min2_speedy_news/viewmodels/headline_viewmodel.dart';
import 'package:min2_speedy_news/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [   /// [NEST: Nest structure actually -> Need to consider nest order]
          ChangeNotifierProvider<NewsListViewModel>(
            create: (_) => NewsListViewModel(),
          ),
          ChangeNotifierProvider<HeadlineViewModel>(   /// [NEST: HeadlineViewModel < NewsListViewModel]
            create: (_) => HeadlineViewModel(),
          ),
      ],
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
