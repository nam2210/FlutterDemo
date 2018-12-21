import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';  

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext content){
     final wordPair = new WordPair.random();
      return new MaterialApp(
        title: "Hello Nam, this is flutter",
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Nam Flutter"),
          
          ),
          body: new Center(
            child: new Text(wordPair.asPascalCase),
          ),
        ),
      );
  }
}

  