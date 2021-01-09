import 'package:moor/moor.dart';
/// [tegaki: g.dart生成用ファイルのクラス（database.dart/ArticleMoors）呼び込み]
import 'package:min2_speedy_news/models/db/database.dart';

part 'dao.g.dart';




/// [database.dart/ArticleMoors() から呼び込み]
/// @UseMoor(tables: [ArticleMoors])   /// [@UseMoor -> ここはDao -> @UseDao]
@UseDao(tables: [ArticleMoors])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {

  NewsDao(MyDatabase db) : super(db);


  /// [delete: DBの既存データを、clear消し込む]
  Future clearDB() => delete(articleMoors).go();

  /// [insert: DBへ新規データを、insert入れ込む]
  Future insertDB(List<ArticleMoor> articles) async {
    await batch((batch) {
      batch.insertAll(articleMoors, articles);
    });
  }

  /// [read: DBの保持データを、読み込む]
  Future<List<ArticleMoor>> get articlesFromDB => select(articleMoors).get();



  /// [=== (3つを一つの取引として実行===) Method tod do delete, insert and read ===]
  /// [Method であり gettrerではない]
  // Future<List<ArticleMoor>> get insertAndReadNeawsFromDB(List<ArticleMoor> articles)
  Future<List<ArticleMoor>> insertAndReadNeawsFromDB(List<ArticleMoor> articles)
      => transaction(() async {
          await clearDB();
          await insertDB(articles);
          return await articlesFromDB;
      });





}
