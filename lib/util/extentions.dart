/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';
/// [tegaki: g.dart生成用ファイルのクラス（database.dart/ArticleMoors）呼び込み__sssss! -> TYPEはsなし]
import 'package:min2_speedy_news/models/db/database.dart';




/// [ーーーーーーーー Moor独特な記法()()ゆえ、DB保存の際に、DB形式に変換する ーーーーーーーー]


/// [===== (1)Dartのモデルクラス -> DBのテーブルクラス =====]
/// ["extention" 推論コード必要]
extension ConvertToArticleMoor on List<Article> {

  List<ArticleMoor> toArticleMoors(List<Article> articles){

      /// var articleMoors = List<ArticleMoor>();   [To create an empty list, use []]
      // var articleMoors = [];
      var articleMoors = [].cast<ArticleMoor>();   /// [cast<>(): Change type]

      articles.forEach((article) {    /// [METHOD((XXX) => XXX)  or  METHOD((XXX){}]
        articleMoors.add(
            ArticleMoor(
                title: article.title ?? "",   /// [三項演算子!!!]
                description: article.description ?? "",
                url: article.url ?? "",
                urlToImage: article.urlToImage ?? "",
                publishDate: article.publishDate ?? "",
                content: article.content ?? "",
            ),
        );
      });

      /// [Moor形式変換後にreturn]
      return articleMoors;
  }
}




/// [===== (2)DBのテーブルクラス -> Dartのモデルクラス =====]
extension ConvertToArticle on List<ArticleMoor> {

  List<Article> toArticles(List<ArticleMoor> articleMoors){

      // var articleMoors = List<Article>();
      var articles = [].cast<Article>();   /// [cast<>(): Change type]

      articleMoors.forEach((articleMoor) {    /// [METHOD((XXX) => XXX)  or  METHOD((XXX){} -> 2()]
        articles.add(
            Article(
                title: articleMoor.title ?? "",   /// [三項演算子!!!]
                description: articleMoor.description ?? "",
                url: articleMoor.url ?? "",
                urlToImage: articleMoor.urlToImage ?? "",
                publishDate: articleMoor.publishDate ?? "",
                content: articleMoor.content ?? "",
            ),
        );
      });

      return articles;
  }
}