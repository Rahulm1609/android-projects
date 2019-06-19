import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  List<WordPair> _suggestions = <WordPair>[];
  Set<WordPair> _saved = Set<WordPair>();
  var _biggerFont = const TextStyle(fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd)
        return new SizedBox(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
            height: 1.5,
            color: Colors.black26,
          ),
        );
      var index = i ~/ 2;
      if (index >= _suggestions.length)
        _suggestions.addAll(generateWordPairs().take(10));

      var pair = _suggestions[index];
      final bool alreadySaved = _saved.contains(pair);

      return ListTile(
          title: Text(_suggestions[index].asPascalCase, style: _biggerFont),
          trailing: Icon(
            // Add the lines from here...
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: () {
            setState(() {
              if (alreadySaved) {
                _saved.remove(pair);
              } else {
                _saved.add(pair);
              }
            });
          });
    });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            // Add 6 lines from here...
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          ); // ... to here.
        },
      ),
    );
  }
}
