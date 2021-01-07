import 'package:flutter/material.dart';
/// [tegaki: import:xxx/news_model.dart]
import 'package:min2_speedy_news/models/model/news_model.dart';
import 'package:min2_speedy_news/style/style.dart';



class ArticleTileDesc extends StatelessWidget {

  final Article article;
  const ArticleTileDesc({this.article});

  @override
  Widget build(BuildContext context) {

    /// [呼び込む。context from MaterialApp/ThemeData]
    final textTheme = Theme.of(context).textTheme;

    /// [apiDataの内,descriptionはnullがあり得る]
    var displayDesc = "";
    if (article.description != null){
      displayDesc = article.description;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          article.title,
          style: textTheme.subtitle1.copyWith(   /// [copyWith(): defaultThemeの部分的修正]
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          article.publishDate,
          style: textTheme.overline.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 2),
        Text(
          // article.description,
          displayDesc,
          style: textTheme.bodyText2.copyWith(
            fontFamily: RegularFont,
          ),
        ),
      ],
    );
  }
}