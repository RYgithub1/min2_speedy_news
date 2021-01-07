import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';
import 'package:min2_speedy_news/data/search_type.dart';
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
        body: Center(child: Text("headline")),
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