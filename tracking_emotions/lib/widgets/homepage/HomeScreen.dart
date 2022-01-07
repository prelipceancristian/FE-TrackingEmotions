import 'package:flutter/material.dart';
import 'package:tracking_emotions/widgets/dialogs/pop-up-question.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 250),
          child: Text(
            'How are you \n feeling today ?',
            style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.all(25),
          child: TextButton(
              child: Text(
                "Let's start",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                TextStyle(backgroundColor: Colors.red);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PopUpQuestion()));
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.only(bottom: 16, top: 16, left: 32, right: 32),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.brown),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.brown,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ))),
        ),
      ])),
      backgroundColor: Color.fromRGBO(238, 161, 119, 1.0),
    );
  }
}
