import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/models/networking/api_service.dart';
/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';
// import 'package:min2_speedy_news/models/model/news_model.g.dart';



/// [MVVM -> Model contacted to ViewModel layer]
class NewsRepository {

  final ApiService _apiService = ApiService.create();

  // argu of viewModel -> view
  // getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) {
  // Future<void> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async{
  Future<List<Article>> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async {
    print("comm Repository: : $searchType, $keyword, ${category.categoryNameJp}");


    /// [responceをDB/Cloudから取得してtry-catch]
    /// [{response/data}: 1.◯/◯, 2.◯/x, 3.x/-]
    /// [error: 'List' is deprecated and shouldn't be used.]
    List<Article> result = List<Article>();  // TODO:
    // List<Article> result = [];
    // List<Article> result;
    Response response;

    try {
        // 検索パターン3つ
        switch(searchType){
            case SearchType.HEAD_LINE:
                // await _apiService.getHeadLines();
                response = await _apiService.getHeadLines();   /// [Response Type]
                break;
            case SearchType.KEYWORD:
                // await _apiService.getKeywordNews();
                // await _apiService.getKeywordNews(keyword: keyword);
                response = await _apiService.getKeywordNews(keyword: keyword);   /// [Response Type]
                break;
            case SearchType.CATEGORY:
                // await _apiService.getCategoryNews();
                /// await _apiService.getCategoryNews(category: category.categoryNameEn);  /// [カテゴリ検索はeng]
                response = await _apiService.getCategoryNews(category: category.categoryNameEn);   /// [Response Type]
                break;
        }

        if (response.isSuccessful) {   /// [1.◯/◯]
            final responseBody = response.body;
            result = News.fromJson(responseBody).articles;
            /// print("comm: ◯/◯: $result");  [articlesゆえ詳細指定しないと、配列「Instance of 'Article',xxx」を返す]
            print("comm: Repository: ◯/◯: $responseBody");   /// [Json多階層で返す]
        } else {   /// [2.◯/x]
            final errorCode = response.statusCode;
            final error = response.error;
            print("comm: Repository: ◯/x: response is not successful: $errorCode / $error");
        }

    } on Exception catch(err) {   /// [3.x/-]
        print("comm: Repository: $err");
    }
    /// [Future<List<Article>>getNews() ゆえ、Future<List<Article>>へのreturn必要]
    return result;
  }


  /// [ApiService -> NEED dispose() ... also define _repository.dispose();]
  void dispose() {
    _apiService.dispose();
  }

}
