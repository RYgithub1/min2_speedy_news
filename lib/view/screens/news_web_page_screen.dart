import 'package:flutter/material.dart';
/// [tegaki: no import, no type]
import 'package:min2_speedy_news/models/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';



class NewsWebPageScreen extends StatelessWidget {

  final Article article;
  NewsWebPageScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(article.title), centerTitle: true),

        body: WebView(   /// [WebView()]
          initialUrl: article.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}