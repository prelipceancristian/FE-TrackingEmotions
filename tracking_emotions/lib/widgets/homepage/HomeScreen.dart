import 'package:flutter/material.dart';
import 'package:tracking_emotions/widgets/dialogs/pop-up-question.dart';
import 'package:tracking_emotions/widgets/user-details/user-details-page.dart';

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
        GestureDetector(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserDetailsPage()))
          },
          child: Container(
            margin: const EdgeInsets.only(top: 215.0, left: 300.0),
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(238, 161, 119, 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/user_page.jpg',
                ),
              ),
            ),
          ),
        ),
      ])),
      backgroundColor: Color.fromRGBO(238, 161, 119, 1.0),
    );
  }
}
