import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';



// [News API のURL -> 2CLASS作成/ネスト構造->CLASS重ねて表現]
// [.fromJson: JsonからModelCLASSに変換]
// ------ １階層 ------
// 自動生成ファイル用_fromJson_toJson
@JsonSerializable()
class News {
  final List<Article> articles;
  News({this.articles});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}


// ------ ２階層 ------
// [nestしている各々にannotation必要]
// [parametaをpropaty名にしない場合 -> @JsonKey]
// 自動生成ファイル用_fromJson_toJson
@JsonSerializable()
class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  @JsonKey(name: "publishedAt") final String publishDate;
  final String content;
  Article({this.title, this.description, this.url, this.urlToImage, this.publishDate, this.content});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
