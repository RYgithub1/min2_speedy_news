import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/chip_category_name.dart';
import 'package:min2_speedy_news/data/search_type.dart';



/// [MVVM -> Model contacted to ViewModel layer]
class NewsRepository {



  // argu of viewModel -> view
  // getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) {
  Future<void> getNews({@required SearchType searchType, String keyword, ChipCategoryName category}) async{
    print("comm Model: $searchType, $keyword, ${category.categoryNameJp}");



    
  }



}