import 'package:flutter/material.dart';
import 'package:moor/moor.dart';

part 'database.g.dart';



class ArticleRecords extends Table {
  /// [以下Moor独特の記法]
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  TextColumn get punbilshDate => text()();
  TextColumn get content => text()();

  @override
  set<Column> get primaryKey => {url};

}

@UseMoor(tables: [ArticleRecords])
class MyDatabase {
}
