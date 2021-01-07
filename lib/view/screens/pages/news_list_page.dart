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

    /// [contextゆえbuild配下...VMからProvide受けるインスタンス定義=Lodingチェック用]
    /// [UI用でなくcallのみゆえrebuild()させない]
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    /// [(!=)ロードしてない,&&記事が一件もない  // VM経由でcall、ロード状況で場合分け]
    if(!viewModel.isLoading && viewModel.articles.isEmpty) {
      // viewModel.getNews(searchType: SearchType.CATEGORY, category: categories[0]);
      /// [FutureError <- 「setState() or markNeedsBuild() called during build.」]
      // TODO: 単純にFuture or Future(() => XXX)
      Future(() => viewModel.getNews(searchType: SearchType.CATEGORY, category: categories[0]));
    }


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

              Expanded(
                child: Consumer<NewsListViewModel>(
                  builder: (context, newsListViewModel, child) {
                    return newsListViewModel.isLoading    /// [isLoding=true -> Circular]
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: newsListViewModel.articles.length,
                            itemBuilder: (context, int position) {
                                return ListTile(
                                  title: Text(newsListViewModel.articles[position].title),
                                  subtitle: Text(newsListViewModel.articles[position].description),
                                );
                            },
                        );
                  },
                ),
              ),
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
