import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/view/components/category_chips.dart';
import 'package:min2_speedy_news/view/components/search_bar.dart';
import 'package:min2_speedy_news/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';



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
              /// [Devide class -> components]
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



  /// [===== method() ======]
  // -- Refresh: fab --
  Future<void> onRefresh(BuildContext context) async{
    print("comm: onRefresh()");
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: viewModel.searchType,   /// ["viewModel"で定義した物を活用]
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
  }


  // -- KEYWORD: search bar --
  Future<void> getKeywordNews(BuildContext context, keywordYade) async {
    print("comm: getKeywordNews()");
    /// [Provider.of<TA>(): listen:false -> Needless UI rebuild]
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keywordYade,
      category: categories[0],   /// [初期値へ飛ばしてoverrideする値]
      // category: category,
    );
  }


  // -- CATEGORY: category chips --
  Future<void> getCategoryNews(BuildContext context, categoryYade) async {
    print("comm: getCategoryNews()");
    /// [Provider.of<TA>()]
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      keyword: "xxx",
      category: categoryYade,
    );
  }

}
