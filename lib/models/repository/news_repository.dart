import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/chip_category_name.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/models/networking/api_service.dart';



/// [MVVM -> Model contacted to ViewModel layer]
class NewsRepository {

  final ApiService _apiService = ApiService.create();

  // argu of viewModel -> view
  // getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) {
  // Future<void> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async{
  // Future<Article> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async {
  Future<List<Article>> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async {
    print("comm Model: $searchType, $keyword, ${category.categoryNameJp}");


    // 検索パターン3つ
    switch(searchType){
      case SearchType.HEAD_LINE:
          await _apiService.getHeadLines();
          break;
      case SearchType.KEYWORD:
          // await _apiService.getKeywordNews();
          await _apiService.getKeywordNews(keyword: keyword);
          break;
      case SearchType.CATEGORY:
          // await _apiService.getCategoryNews();
          await _apiService.getCategoryNews(category: category.categoryNameEn);  /// [カテゴリ検索はenglish]
          break;
    }

  }


}
