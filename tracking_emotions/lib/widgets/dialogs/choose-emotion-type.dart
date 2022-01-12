import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:tracking_emotions/widgets/choose-category/choose_category_screen.dart';
import 'package:tracking_emotions/widgets/dialogs/pop-up-question.dart';

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
      backgroundColor: Color.fromARGB(255, 250, 237, 227),
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
                height: 310,
                margin: EdgeInsets.only(top: 300),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 249, 187, 178)),
                child: Column(
                  children: <Widget>[
                    new Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 20),
                      child: new TextButton(
                        onPressed: () {
                          print('Pressed!');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseCategory(1)));
                        },
                        child: Text(
                          "Positive",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.red[300].withOpacity(0.7)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red[400]),
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

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseCategory(-1)));
                          //:TODO Send to next screen
                        },
                        child: Text(
                          "Negative",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.red[300].withOpacity(0.7)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red[400]),
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

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseCategory(0)));
                          //:TODO Send to next screen
                        },
                        child: Text(
                          "Neutral",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.red[300].withOpacity(0.7)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red[400]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      width: 250,
                      margin: EdgeInsets.only(top: 15, left: 100),
                      child: new TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PopUpQuestion()));
                        },
                        child: Text(
                          "I've changed my mind",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10)),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.brown[300].withOpacity(0.7)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.brown[400]),
                            ),
                          ),
                        ),
                      ),
                    ),
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
