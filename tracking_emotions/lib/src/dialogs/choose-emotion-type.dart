import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

void main() {
  runApp(ChooseEmotionType());
}

class ChooseEmotionType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: Container(
        child: Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(top: 100.0),
                  child: BubbleSpecialTwo(
                    text: 'What kind of emotion is it?',
                    isSender: false,
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(top: 200.0),
                  child: BubbleSpecialTwo(
                    text: '  ...  ',
                    isSender: true,
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                margin: EdgeInsets.only(top: 300),
                decoration:
                    BoxDecoration(color: Color.fromRGBO(156, 80, 82, 1)),
                child: Column(
                  children: <Widget>[
                    new Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 30),
                      child: new TextButton(
                        onPressed: () {
                          print('Pressed!');
                          //:TODO Send to next screen
                        },
                        child: Text(
                          "Positive",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 20),
                      child: new TextButton(
                        onPressed: () {
                          print('Pressed!');
                          //:TODO Send to next screen
                        },
                        child: Text(
                          "Negative",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 20),
                      child: new TextButton(
                        onPressed: () {
                          print('Pressed!');
                          //:TODO Send to next screen
                        },
                        child: Text(
                          "Neutral",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
