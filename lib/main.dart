// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: FoodWords(),
    );
  }
}

class FoodWords extends StatefulWidget {
  @override
  _FoodWordsState createState() => _FoodWordsState();
}


class _FoodWordsState extends State<FoodWords> {
  @override
  final _suggestions = <WordPair>[];
  // final _suggestions
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('優惠券'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('嫩煎雞腿堡'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourNewPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('10元冰淇淋'),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('蕈菇豬肉滿福堡'),
          ),
        ],
      ),
    );
  }

  Widget YourNewPage(){

  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}