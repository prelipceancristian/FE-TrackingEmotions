import 'package:flutter/material.dart';

import './selector.dart';
import 'submitEmotionRecordPageText.dart';

class SubmitEmotionRecordPage extends StatefulWidget {
  @override
  _SubmitEmotionRecordPageState createState() =>
      _SubmitEmotionRecordPageState();
}

class _SubmitEmotionRecordPageState extends State<SubmitEmotionRecordPage> {
  final List<String> emotions = [
    'fericit',
    'suparat',
    'melancolic',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
  ];

  final List<String> locations = [
    'valcea',
    'cluj',
    'oradea',
  ];

  final List<String> people = [
    'andrei',
    'alex',
    'FLORIN',
  ];

  Selector emotionSelector;
  Selector locationsSelector;
  Selector peopleSelector;

  String selectedEmotion;
  String selectedLocation;
  String selectedPerson;

  _SubmitEmotionRecordPageState() {
    this.emotionSelector =
        new Selector(emotions, 'emotion', getDropDownEmotion);
    this.locationsSelector =
        new Selector(locations, 'location', getDropDownLocation);
    this.peopleSelector = new Selector(people, 'person', getDropDownPerson);
  }

  void getDropDownEmotion(String text) {
    this.selectedEmotion = text;
  }

  void getDropDownLocation(String text) {
    this.selectedLocation = text;
  }

  void getDropDownPerson(String text) {
    this.selectedPerson = text;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffd1d1),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Submit your emotion',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SubmitEmotionRecordPageText(
              'I felt',
            ),
            emotionSelector,
            SubmitEmotionRecordPageText(
              'when I was at',
            ),
            locationsSelector,
            SubmitEmotionRecordPageText(
              'with',
            ),
            peopleSelector,
            Container(
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 28),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.black.withOpacity(1);
                      return Colors.black.withOpacity(0.5);
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              width: 200,
              height: 60,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    print(selectedEmotion + " " + selectedLocation + " " + selectedPerson);
  }
}
