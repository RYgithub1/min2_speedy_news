import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/view/components/page_transformer.dart';
import 'package:min2_speedy_news/viewmodels/headline_viewmodel.dart';
import 'package:provider/provider.dart';



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
        body: Consumer<HeadlineViewModel>(
          builder: (context, headlineViewModel, child){
            return PageTransformer(   /// [+PageTransformer]
              pageViewBuilder: (context, pageVisivilityResolver) {
                return PageView.builder(
                  controller: PageController(initialPage: 1),   /// [PageView need controller]
                  itemCount: headlineViewModel.articles.length,
                  itemBuilder: (context, index) {
                    final article = headlineViewModel.articles[index];
                    final pageVisivility = pageVisivilityResolver.resolvePageVisibility(index);   /// [+PageTransformer]
                    final visivilityFraction = pageVisivility.visibleFraction;   /// [+PageTransformer]

                    return Opacity(   /// [+PageTransformer ... opacityコラボでページスクロールに合わせて透過]
                      opacity: visivilityFraction,   /// [+PageTransformer]
                      child: Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(article.title),
                              Text(article.description),


                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              },
            );
          },
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

}