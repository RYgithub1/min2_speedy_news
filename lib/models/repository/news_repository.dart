import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';
import 'package:min2_speedy_news/data/search_type.dart';
import 'package:min2_speedy_news/main.dart';
import 'package:min2_speedy_news/models/networking/api_service.dart';
/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';
// import 'package:min2_speedy_news/models/model/news_model.g.dart';

/// [tegaki: no import, no type]
import 'package:min2_speedy_news/util/extentions.dart';

import '../networking/api_service.dart';

/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/db/dao.dart';




/// [MVVM -> Model contacted to ViewModel layer]
class NewsRepository {

  /// [可読性のため外出ししていたAPI呼び込み用クラスを使いたい->Repositoryでインスタンス化]
  // final ApiService _apiService = ApiService.create();
  /// [````` For ProxyProvider `````]
  final ApiService _apiService;
  final NewsDao _dao;
  NewsRepository({dao, apiService}) : _apiService = apiService, _dao = dao;



  // argu of viewModel -> view
  // getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) {
  // Future<void> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async{
  Future<List<Article>> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async {
    // / print("comm Repository: : $searchType, $keyword, ${category.categoryNameJp}");
    /// [NOTICE: _repository.getNews共通化なら、引数categoryNameJpのnull"でエラー]


    /// [responceをDB/Cloudから取得してtry-catch]
    /// [{response/data}: 1.◯/◯, 2.◯/x, 3.x/-]
    /// [error: 'List' is deprecated and shouldn't be used.]
    /// List<Article> result = List<Article>();  /// [NOTICE: Creates a list of the given length.]
    List<Article> result = [];
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

        if (response.isSuccessful) {   /// [1.◯/◯]&&[.isSuccessful: statusCode >= 200 && statusCode < 300 -> true]
            final responseBody = response.body;
            result = News.fromJson(responseBody).articles;   /// [news_repository.dart/News class/ .fromJson]
            /// print("comm: ◯/◯: $result");  [articlesゆえ詳細指定しないと、配列「Instance of 'Article',xxx」を返す]
            print("comm: Repository: ◯/◯: $responseBody");   /// [Json多階層で返す]
            // result = await insertAndReadFromDB();
            result = await insertAndReadFromDB(responseBody);
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





  /// [RepoでMoor形式受け渡しや変換]
  Future<List<Article>> insertAndReadFromDB(responseBody) async {

    // final dao = myDatabase.newsDao;   /// [DB使うので定義]
    /// [````` For ProxyProvider `````]


    final articles = News.fromJson(responseBody).articles;   /// [JsonからModelクラスに変換]
    // final articleMoors = await dao.insertAndReadNeawsFromDB(
    /// [````` For ProxyProvider `````]
    final articleMoors = await _dao.insertAndReadNeawsFromDB(
      articles.toArticleMoors(articles),
    );

    /// [DBから取得したデータをModelクラスに再変換してRepositoryに格納（これでVMに返せる）]
    return articleMoors.toArticles(articleMoors);
  }

}
