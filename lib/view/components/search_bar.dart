import 'package:flutter/material.dart';



class SearchBar extends StatelessWidget {

  TextEditingController _textEditingController = TextEditingController();

  SearchBar({this.onSearch});
  final ValueChanged onSearch;


  /// [========== build() ==========]
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: const BorderRadius.all(const Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Input search-words",
            border: InputBorder.none,
          ),
          onSubmitted: onSearch,
        ),
      ),
    );
  }
}