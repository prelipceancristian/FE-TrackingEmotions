import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracking_emotions/widgets/dialogs/pop-up-question.dart';

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 350),
              child: Text(
                'Congratulations! \n You have logged your first emotion!',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.red[100],
    );
  }
}
