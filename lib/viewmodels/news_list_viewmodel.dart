import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/models/repository/news_repository.dart';
/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';
// import 'package:min2_speedy_news/models/model/news_model.g.dart';



/// [logic -> Model() && bridge -> here, ViewModel()]
class NewsListViewModel extends ChangeNotifier {

  /// [xxxxxxxxx PROPERTY xxxxxxxxx]
  /// [======== Connect to NewsRepository() = Model layer ========]
  // final NewsRepository _repository = NewsRepository();
  /// [````` For ProxyProvider `````]
  final NewsRepository _repository;
  NewsListViewModel({repository}): _repository = repository;



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
  /// [repositoryから -> ViewModelへ受け取りnotifyListeners()通知]
  /// List<Article> _articles = List();  /// [NOTICE: Creates a list of the given length.]
  List<Article> _articles = [];
  List<Article> get articles => _articles;



  /// [xxxxxxxxx METHOD xxxxxxxxx]
  /// [News受け渡し用method: Page -> ViewModel here -> Modelrepository]
  // model内で定義したTypeを引数にしつつ、受け渡す
  // getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) {
  /// [* 時間のかかる処理はFuture]
  Future<void> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async {
      /// print("comm ViewModel: $searchType, $keyword, ${category.categoryNameJp}, ${articles[0]}");  [-> Instance of 'Article'そのまま渡してしまう]
      // print("comm ViewModel_1: $searchType, $keyword, ${category.categoryNameJp}, ${_articles[0].title}");  // _articles[0]もarticles[0]もエラー「Valid value range is empty: 0」
      print("comm ViewModel_1: $searchType, $keyword, ${category.categoryNameJp},  ok");   /// [ok, without _articles[0]]

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


      // await _repository.getNews(
      /// [戻り値として返すのでなく代入（通知->viewに反映）]
      _articles = await _repository.getNews(
          searchType: _searchType,
          keyword: _keyword,
          category: _category,
      );

      print("\n\ncomm ViewModel_2: $_searchType, $_keyword, $_category, ${_articles[0].title}");
      // print("\n\n\ncomm ViewModel_3: ${_articles[0].title}");
      // print("\n\n\ncomm ViewModel_4: ${articles[0].title}");

      _isLoading = false;
      notifyListeners();
  }



  /// [xxxxxxxxx DISPOSE xxxxxxxxx]
  @override
  void dispose() {
    _repository.dispose();  /// [ApiServiseのdispose]
    super.dispose();
  }


}