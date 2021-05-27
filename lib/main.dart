import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  builder: (context) => Page2(),
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
                  builder: (context) => Page2(),
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
                  builder: (context) => Page2(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  String get title => "優惠券";
  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Page3(),
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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffcc311f),
        centerTitle: true,
      ),
      body:Stack(
        alignment: const Alignment(0, 1),
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),

          InkWell(
            child:
            Container(
              decoration: BoxDecoration(
                color: Color(0xffffa72f),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Center(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        "兌換優惠",
                        style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            onTap: () {
              showAlertDialog(context);
            },
          ),


        ]
      )

    );
  }
}

class Page3 extends StatefulWidget {
  String get title => "優惠券";
  @override
  State<StatefulWidget> createState() => _Page3State();
}
class _Page3State extends State<Page3> {
  int _counter = 0;
  Timer _timer;
  int _start = 59;

  void initState() {
    super.initState();
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) => setState(() {
        if (_start < 1) {
          timer.cancel();
        } else {
          setState(() {
            _start--;
          });
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffcc311f),
        centerTitle: true,
      ),
      body:
      Stack(
        alignment: const Alignment(0, 1),
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffa72f),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 90,
              child: Center(
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Image.asset(
                        'images/clock.png',
                        height: 30.0,
                      ),
                      new Text(
                        " 優惠倒數 "+"1:" + '$_start'.toString(),
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}