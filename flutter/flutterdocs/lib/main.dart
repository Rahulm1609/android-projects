import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MaterialApp(
      title: "Flutter Docs",
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(title: Text("Flutter docs"),),
      body: Center(
        child: Text(wordPair.asCamelCase),
      ),
    );
  }
}






