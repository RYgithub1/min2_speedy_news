import 'package:flutter/material.dart';
import 'package:min2_speedy_news/view/screens/pages/headline_page.dart';
import 'package:min2_speedy_news/view/screens/pages/news_list_page.dart';
import 'package:min2_speedy_news/view/screens/pages/about_us_page.dart';
import 'package:min2_speedy_news/view/components/hot_video_page.dart';
import 'package:min2_speedy_news/view/screens/pages/video_show_page.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  /// [BNB1.Create List for transfering and page index]
  int _currentIndex = 0;
  final _pages = [
    HeadlinePage(),
    NewsListPage(),
    AboutUsPage(),
    // VideoShowPage(),   /// [chewie]
  ];


  /// [========== build() ==========]
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      /// [BNB2.Set currentIndex and items &&  Make onTap property]
      body: _pages[_currentIndex],


      bottomNavigationBar: BottomNavigationBar(
        /// [BNB2.Set currentIndex and items &&  Make onTap property]
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: const Icon(Icons.highlight),   /// [const for memory]
            label: "breaking",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: "list",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.app_settings_alt),
            label: "about",
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.video_call),
          //   label: "video",
          // ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}