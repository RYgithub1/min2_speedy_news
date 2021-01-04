import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/search_type.dart';



/// [logic -> Model]
class NewsListViewModel extends ChangeNotifier {


  /// [enum使い方：serchTypeをpropertyとしてもつ]
  SearchType _searchType = SearchType.CATEGORY;
  /// [カプセル化でclassの安全性向上]
  // _searchTypeプライベートゆえ外部との受け渡し不可
  // getter経由なら、外部からの変更は不可のまま、外部からの値取得は可能
  SearchType get searchType => _searchType;


  Category _category = category[0];
  Category get category => _category;


  String _keyword = "";
  String get keyword => _keyword;


  /// [CircularProgressIndicator()の要否]
  bool _isLoading = false;
  bool get isLoading => _isLoading;


}