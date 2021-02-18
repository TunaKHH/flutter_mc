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
  final _saved = Set<WordPair>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('優惠券'),
        backgroundColor: Color(0xffcc311f),
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
                  builder: (context) => yourNewPage(context),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('10元冰淇淋'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => yourNewPage(context),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('蕈菇豬肉滿福堡'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => yourNewPage(context),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget yourNewPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('優惠券'),
        centerTitle: true,
        backgroundColor: Color(0xffcc311f),
      ),
      body: ListView(
        // This next line does the trick.
        reverse: true,
        children: <Widget>[

          InkWell(
            child: new Image.asset(
              'images/2.png',
              // height: 60.0,
              fit: BoxFit.cover,

            ),
            onTap: () {
              showAlertDialog(context);
              // print("tapped on container");
            },


          ),

        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("暫不兌換"),
      onPressed:  () => Navigator.pop(context),
    );
    Widget continueButton = FlatButton(
      child: Text("立即兌換"),
      onPressed:  () {
        Navigator.pop(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('優惠券3'),
            centerTitle: true,
            backgroundColor: Color(0xffcc311f),

          ),
          body: ListView(
            // This next line does the trick.
            reverse: true,
            children: <Widget>[
              new Image.asset(
                'images/1.png',
                height: 60.0,
                fit: BoxFit.fitWidth,
              ),


            ],
          ),
        );


      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("確認兌換優惠"),
      content: Text("請確認您已在麥當勞櫃台，點選「立即兌換」後，需於兩分鐘內出示給結帳人員"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}