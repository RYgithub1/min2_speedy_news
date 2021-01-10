import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../models/db/dao.dart';
import '../models/networking/api_service.dart';
import '../models/networking/api_service.dart';
/// [tegaki: g.dart生成用ファイルのクラス（database.dart/ArticleMoors）呼び込み]
import 'package:min2_speedy_news/models/db/database.dart';

import '../models/repository/news_repository.dart';
import '../viewmodels/headline_viewmodel.dart';
import '../viewmodels/news_list_viewmodel.dart';



/// [main.dart ===>>> di_providers.dart: Many Providers and DIs -> one file]
List<SingleChildWidget> globalProviders = [
    ...independentModels,
    ...dependentModels,
    ...viewModels,
];




/// [========= independentModels=========]
List<SingleChildWidget> independentModels = [
  Provider<ApiService>(
    create: (_) => ApiService.create(),
    dispose: (_, apiService) => apiService.dispose(),
  ),
  Provider<MyDatabase>(
    create: (_) => MyDatabase(),
    dispose: (_, db) => db.close(),
  ),
];


/// [========= dependentModels =========]
List<SingleChildWidget> dependentModels = [
  ProxyProvider<MyDatabase, NewsDao>(
    update: (_, db, dao) => NewsDao(db),
  ),
  ProxyProvider2<NewsDao, ApiService, NewsRepository>(
    update: (_, dao, apiService, repository) => NewsRepository(dao: dao, apiService: apiService),
  ),
];


/// [========= viewModels =========]
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HeadlineViewModel>(
    create: (context) => HeadlineViewModel(
      repository: Provider.of<NewsRepository>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider<NewsListViewModel>(
    create: (context) => NewsListViewModel(
      repository: Provider.of<NewsRepository>(context, listen: false),
    ),
  ),
];
