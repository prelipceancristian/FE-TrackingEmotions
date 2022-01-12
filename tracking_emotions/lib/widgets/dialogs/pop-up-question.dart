import 'package:flutter/material.dart';
import 'package:tracking_emotions/widgets/submit_emotion_record_page/submitEmotionRecordPage.dart';
import 'choose-emotion-type.dart';

void main() => runApp(PopUpQuestion());

/// This is the main application widget.
class PopUpQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 250, 237, 227)),
      home: Scaffold(
        body: Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 249, 187, 178),
      title: Align(
        child: const Text(
          'Can you identify your emotions?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChooseEmotionType()));
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.red[300].withOpacity(0.7)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red[400]),
              ),
            ),
          ),
          child: Align(
            child: Text(
              'I can not!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        Container(
          height: 10,
        ),
        ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.red[300].withOpacity(0.7)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red[400]),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubmitEmotionRecordPage()));
            },
            child: Align(
              child: Text(
                "I can!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            )),
      ],
    );
  }
}
