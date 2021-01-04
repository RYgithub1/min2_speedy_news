import 'package:flutter/material.dart';
import 'package:min2_speedy_news/view/components/category_chips.dart';
import 'package:min2_speedy_news/view/components/search_bar.dart';



class NewsListPage extends StatelessWidget {


  /// [========== build() ===========]
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              /// [Devide to class components]
              SearchBar(
                onSearch: (keywordYade) => getKeywordNews(context, keywordYade),
              ),
              CategoryChips(
                onCategorySelected: (categoryYade) => getCategoryNews(context, categoryYade),
              ),
              Expanded(child: Center(child: CircularProgressIndicator())),
              
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          tooltip: "REFRESH",
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),
        ),
      ),
    );
  }



  /// [========== method() ===========]
  onRefresh(BuildContext context) {
    print("comm: onRefresh()");
  }

  getKeywordNews(BuildContext context, keyword) {
    print("comm: getKeywordNews()");
  }

  getCategoryNews(BuildContext context, category) {
    print("comm: getCategoryNews()");
  }

}



/// [----- sup -----]
