import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';



class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}



class _AboutUsPageState extends State<AboutUsPage> {

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("GET NEWS"), centerTitle: true),

        body: Center(
          child: AnimatedContainer(   /// [GOD: AnimatedContainer]
            color: _selected
                ? Colors.orange[600]
                : Colors.orange[100],
            width: _selected
                ? 300
                : 80,
            height: _selected
                ? 600
                : 100,
            alignment: _selected
                ? Alignment.center
                : Alignment.topCenter,
            duration: Duration(milliseconds: 3000),
            curve: Curves.fastOutSlowIn,
            // child: _selected
            //     ? Text("FLUTTER", style: TextStyle(fontSize:72))
            //     : Text("flutter", style: TextStyle(fontSize:20)),
            child: AutoSizeText(
              "news's watching you",
              style: TextStyle(fontSize: 60),
              maxLines: 1,
              minFontSize: 12,
              overflow: TextOverflow.visible,
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.article),
          tooltip: "initiative",
          onPressed: () {
              setState(() {
                /// _selected: !_selected;  [error: dataが反映されない]
                _selected = !_selected;
              });
              // print("comm: fab");
          },
        ),
      ),
    );
  }
}