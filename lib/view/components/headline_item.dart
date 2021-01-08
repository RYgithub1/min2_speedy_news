import 'package:flutter/material.dart';
/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';
import 'package:min2_speedy_news/view/components/image_from_url.dart';
import 'package:min2_speedy_news/view/components/lazy_load_text.dart';
import 'package:min2_speedy_news/view/components/page_transformer.dart';



class HeadlineItem extends StatelessWidget {

  final Article article;
  final PageVisibility pageVisibility;   /// [tegaki import]
  // final Function onArticleClicked;
  final ValueChanged onArticleClicked;  /// [Function with arg]
  HeadlineItem({this.article, this.pageVisibility, this. onArticleClicked});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => onArticleClicked(article),   /// [pass function: () => METHOD]
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
              DecoratedBox(
                  position: DecorationPosition.background,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.orange[100],
                            Colors.orange[500],
                          ],
                      ),
                  ),
                  child: ImageFromUrl(imageUrl: article.urlToImage),
              ),
              Positioned(
                  right: 32, bottom: 56, left: 32,
                  // child: Text(
                  //     article.title,
                  //     style: textTheme.headline6.copyWith(
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //     textAlign: TextAlign.center,
                  // ),
                  child: LazyLoadText(
                      text: article.title,
                      pageVisibility: pageVisibility,
                  ),
              ),
          ],
        ),
      ),
    );
  }
}