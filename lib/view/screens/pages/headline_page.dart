import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/view/components/headline_item.dart';
import 'package:min2_speedy_news/view/components/page_transformer.dart';
import 'package:min2_speedy_news/view/screens/news_web_page_screen.dart';
import 'package:min2_speedy_news/viewmodels/headline_viewmodel.dart';
import 'package:provider/provider.dart';
/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';



class HeadlinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// [Ckeach provider loading]
    final viewModel = Provider.of<HeadlineViewModel>(context, listen: false);
    if(!viewModel.isLoading && viewModel.articles.isEmpty) {
      /// [ViewModel/getHeadlines()へ飛ばす]
      Future(() => viewModel.getHeadlines(searchType: SearchType.HEAD_LINE));
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Consumer<HeadlineViewModel>(
            builder: (context, headlineViewModel, child){

              /// [builder配下returnで場合分け]
              if (headlineViewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
              } else {
                  return PageTransformer(   /// [+PageTransformer]
                    pageViewBuilder: (context, pageVisibilityResolver) {
                      return PageView.builder(
                        // controller: PageController(initialPage: 1),
                        controller: PageController(viewportFraction: 0.85),   /// [PageView need controller]
                        itemCount: headlineViewModel.articles.length,
                        itemBuilder: (context, index) {
                          final article = headlineViewModel.articles[index];
                          final pageVisibility = pageVisibilityResolver.resolvePageVisibility(index);   /// [+PageTransformer]
                          final visivilityFraction = pageVisibility.visibleFraction;   /// [+PageTransformer]

                          return Opacity(   /// [+PageTransformer ... opacityコラボでページスクロールに合わせて透過]
                              opacity: visivilityFraction,   /// [+PageTransformer]
                              //   child: Container(
                              //     child: Center(
                              //       child: Column(
                              //         children: <Widget>[
                              //           Text(article.title),
                              //           Text(article.description),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // );
                              child: HeadlineItem(
                                article: article,  // = headlineViewModel.articles[index]
                                pageVisibility:  pageVisibility,
                                onArticleClicked: (articleZoi) => _openArticleHeadlinePage(articleZoi, context),
                              ),
                          );
                        },
                      );
                    },
                  );
              }
            },
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),   /// [pass Function: () => method,]
        ),
      ),
    );
  }




  Future<void> onRefresh(context) async{
    print("comm: HeadlinePage/onRefresh");
    final viewModel = Provider.of<HeadlineViewModel>(context, listen: false);
    /// [ViewModel/getHeadlines()へ飛ばす]
    await viewModel.getHeadlines(searchType: SearchType.HEAD_LINE);
  }


  /// [----- click処理_headline page -----]
  /// [headline->webPage: When click article, access to each web page]
  void _openArticleHeadlinePage(Article articleZoi, BuildContext context) {
    print("comm: _openArticleHeadlinePage: ${articleZoi.url}");
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NewsWebPageScreen(article: articleZoi),
        ),
    );
  }

}