import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/search_type.dart';
/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';
import 'package:min2_speedy_news/models/repository/news_repository.dart';




class HeadlineViewModel extends ChangeNotifier {

  /// [PROPERTY: Use same property as NewsListViewModel]
  final NewsRepository _repository = NewsRepository();   /// [Bridge VM and R: Repository共通使用]
  SearchType _searchType = SearchType.HEAD_LINE;
  SearchType get searchType => _searchType;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Article> _articles = [];
  List<Article> get articles => _articles;



  /// [METHOD: ]
  /// [({引数で記述})->Call元をkey-value（convert to named value）]
  Future<void> getHeadlines({@required SearchType searchType}) async {

      _searchType = searchType;
      _isLoading = true;
      notifyListeners();

      /// [戻り値returnでなく自動通知->_articlesに代入してnotifyListeners()]
      _articles = await _repository.getNews(
        searchType: _searchType,
      );
      print("comm: HeadlineViewModel/getHeadlines: $_searchType");
      _isLoading = false;
      notifyListeners();
  }



  /// [DISPOSE: Use same dispose as NewsListViewModel]
  @override
  void dispose() {
    _repository.dispose();
      print("comm: HeadlineViewModel/dispose: ");
    super.dispose();
  }

}