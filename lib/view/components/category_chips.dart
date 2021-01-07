import 'package:flutter/material.dart';
import 'package:min2_speedy_news/data/category_info.dart';



/// [他のWidget跨がずに状態管理可能 -> 部分完結ゆえFulW]
class CategoryChips extends StatefulWidget {

  final ValueChanged onCategorySelected;
  CategoryChips({this.onCategorySelected});

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}




class _CategoryChipsState extends State<CategoryChips> {

  /// [選んだ変数を表す]
  var _valueNumber = 0;

  @override
  Widget build(BuildContext context) {
    /// [指定内で折返しさせる: wrap]
    return Wrap(

      spacing: 8,
      children: List<Widget>.generate(   /// [generateクラス->1つの要素として作成]
        categories.length,
        (int index) {
          return ChoiceChip(   /// [重複chipを回避: ChoiceChip()]
            label: Text(categories[index].categoryNameJp),
            selected: _valueNumber == index,
            onSelected: (bool selected) {
              setState(() {
                _valueNumber = selected
                    ? index
                    : 0;
                widget.onCategorySelected(categories[index]);
              });
            },
          );
        },
      ).toList(),

    );
  }
}

