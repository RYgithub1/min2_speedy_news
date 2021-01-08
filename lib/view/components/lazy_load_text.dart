import 'package:flutter/material.dart';
import 'package:min2_speedy_news/view/components/page_transformer.dart';




class LazyLoadText extends StatelessWidget {

  final String text;
  final PageVisibility pageVisibility;
  LazyLoadText({this.text, this.pageVisibility});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Opacity(
      opacity: pageVisibility.visibleFraction,  /// [ぬめ透過]
      child: Transform(  /// [ぬめ動き]
        alignment: Alignment.topLeft,
        transform: Matrix4.translationValues(
          pageVisibility.pagePosition * 300,
          0.0,
          0.0,
        ),
        child: Text(
          text,
          style: textTheme.headline6.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}