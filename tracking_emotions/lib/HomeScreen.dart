import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 250),
          child: Text(
            'How are you feeling today ?',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.all(25),
          child: TextButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 3,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              primary: Colors.black.withOpacity(0),
            ),
            child: Text(
              "Let's start",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ])),
      backgroundColor: Color.fromRGBO(238, 161, 119, 1.0),
    );
  }
}
