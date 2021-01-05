import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/chip_category_name.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/models/repository/news_repository.dart';



/// [logic -> Model() && bridge -> here, ViewModel()]
class NewsListViewModel extends ChangeNotifier {

  /// [======== Connect to NewsRepository() = Model layer ========]
  final NewsRepository _repository = NewsRepository();




  /// [======== Connect to Page = View layer ========]
  /// [enum方法：serchTypeをpropertyとしてもつ]
  SearchType _searchType = SearchType.CATEGORY;   /// [ここはあくまで初期値]
  /// [カプセル化でclassの安全性向上]
  // _searchTypeプライベートゆえ外部との受け渡し不可
  // getter経由なら、外部からの変更は不可のまま、外部からの値取得は可能
  SearchType get searchType => _searchType;


  ChipCategoryName _category = categories[0];
  ChipCategoryName get category => _category;


  String _keyword = "";
  String get keyword => _keyword;


  /// [CircularProgressIndicator()の要否]
  bool _isLoading = false;
  bool get isLoading => _isLoading;




  /// [======== define article ========]
  List<Article> _articles = List();
  List<Article> get articles => _articles;




  /// [News受け渡し用method: Page -> ViewModel here -> Modelrepository]
  // model内で定義したTypeを引数にしつつ、受け渡す
  // getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) {
  /// [* 時間のかかる処理はFuture]
  Future<void> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async{
    print("comm ViewModel: $searchType, $keyword, ${category.categoryNameJp}");

    /// [Set argu gotten]
    _searchType = searchType;
    _keyword = keyword;
    _category = category;
    /// [データ取得開始->loading（CircularProgressIndicator）->ChangeNotifierへ変更通知]
    _isLoading = true;
    notifyListeners();
    /// [Notify at viewModel -> Pass argus to ModelRepository]
    // await _repository.getNews(
    //   searchType: _searchType,
    //   keyword: _keyword,
    //   category: _category,
    // );

    // _articles = await _repository.getNews(
    await _repository.getNews(
      searchType: _searchType,
      keyword: _keyword,
      category: _category,
    );
    _isLoading = false;
    notifyListeners();





  }


}