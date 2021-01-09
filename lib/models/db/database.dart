import 'dart:io';
import 'package:moor/ffi.dart';
/// import 'dart:html';  [ioでなくhtml選ぶとエラー]

/// [extends Table(4種類) <- Moorをimport出来るTableを選択（誤りならcommentOutしないと選択不可）]
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/cupertino.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';

/// [as X: どのライブラリの関数か指定する(as path)]
import 'package:path/path.dart' as pathKansuuShitei;

import 'dao.dart';

/// ["After" import, Defone part (= code creation file)]
part 'database.g.dart';




/// [Moor独特の記法()() -> そのままpass argでエラー -> MoorのModelClassからArticleクラスへ変換必要]
class ArticleMoors extends Table {   /// [Moor rule: only XXXs]

  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  TextColumn get publishDate => text()();
  TextColumn get content => text()();

  /// [DB操作する場合primaryKeyが必要]
  // @override
  // set<Column> get primaryKey => {url};
}




// @UseMoor(tables: [ArticleMoors])
@UseMoor(tables: [ArticleMoors], daos: [NewsDao])   /// [Add for dao.dart]
class MyDatabase extends _$MyDatabase{

  /// MyDatabase(QueryExecutor e) : super(e);  /// [ref. Moor official]
  MyDatabase() : super(_openConnection());

    @override  /// [ref. Moor official]
    // implement schemaVersion
    // int get schemaVersion => throw UnimplementedError();
    int get schemaVersion => 1;
}




/// [ref. Moor official: top level fanction]
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();

      /// [as path指定なしでも通るが、joinはtopLevel関数ゆえ、関数指定先が不明]
      // final file = File(join(dbFolder.path, 'db.sqlite'));
      final file = File(pathKansuuShitei.join(dbFolder.path, 'news.db'));

      return VmDatabase(file);
  });
}
