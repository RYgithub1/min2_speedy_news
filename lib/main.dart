import 'package:flutter/material.dart';
import 'package:min2_speedy_news/di/di_providers.dart';
import 'package:min2_speedy_news/style/style.dart';
import 'package:min2_speedy_news/view/screens/home_screen.dart';
import 'package:min2_speedy_news/viewmodels/headline_viewmodel.dart';
import 'package:min2_speedy_news/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

/// [tegaki: g.dart生成用ファイルのクラス呼び込み]
import 'package:min2_speedy_news/models/db/database.dart';




// MyDatabase myDatabase;  /// [Moor-Dao]
/// MyDatabase myDatabase = MyDatabase();  /// [Moor-Dao]
/// [````` For ProxyProvider `````]


void main() {
  // myDatabase = MyDatabase();  /// [Moor-Dao]
  /// [````` For ProxyProvider `````]


  runApp(
    MultiProvider(
      // providers: [   /// [NEST: Nest structure actually -> Need to consider nest order]
      //     ChangeNotifierProvider<NewsListViewModel>(
      //       create: (_) => NewsListViewModel(),
      //     ),
      //     ChangeNotifierProvider<HeadlineViewModel>(   /// [NEST: HeadlineViewModel < NewsListViewModel]
      //       create: (_) => HeadlineViewModel(),
      //     ),
      // ],
      /// [````` For ProxyProvider `````]
      providers: globalProviders,   /// [dipendency injection: To di_roviders.dart]

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
