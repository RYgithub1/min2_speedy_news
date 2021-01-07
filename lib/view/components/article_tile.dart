import 'package:flutter/material.dart';
/// [tegaki: import:xxx/news_model.dart]
import 'package:min2_speedy_news/models/model/news_model.dart';
import 'package:min2_speedy_news/view/components/image_from_url.dart';



class ArticleTile extends StatelessWidget {

  /// [news_list_page同様,表示用fiels/constructor定義]
  final Article article;
  // final onArticleClicked;
  /// [clickで記事(url)にアクセスしたい->引数(url)付きメソッド/ファンクションType（Function(T value)）]
  final ValueChanged onArticleClicked;
  // ArticleTile({this.article});
  const ArticleTile({this.article, this.onArticleClicked});   /// [click処理用field追加定義]


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.all(8),
                  child: ImageFromUrl(imageUrl: article.urlToImage),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(article.title),
                      Text(article.publishDate),
                      Text(article.description),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}