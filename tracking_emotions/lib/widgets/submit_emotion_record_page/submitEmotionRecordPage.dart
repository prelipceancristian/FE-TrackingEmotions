import 'package:flutter/material.dart';
import 'package:tracking_emotions/models/emotion.dart';
import 'package:tracking_emotions/utils/services/Emotion-service.dart';
import 'package:tracking_emotions/widgets/after-submit/congratiulations-page.dart';

import './selector.dart';
import 'submitEmotionRecordPageText.dart';

class SubmitEmotionRecordPage extends StatefulWidget {
  @override
  _SubmitEmotionRecordPageState createState() =>
      _SubmitEmotionRecordPageState();
}

class _SubmitEmotionRecordPageState extends State<SubmitEmotionRecordPage> {
  final List<String> emotions = [
    'sad',
    'happy',
    'enthuziastic',
    'angry',
    'gealous',
    'nostalgic',
    'disgusted',
    'worried',
    'grateful',
    'annoyed',
    'passionate',
    'exhausted',
    'fearless',
    'shy',
    'tired',
  ];

  final List<String> locations = [
    'home',
    'university',
    'Cluj',
  ];

  final List<String> people = [
    'Andrei',
    'Alex',
    'Florin',
  ];

  final Map<String, String> peopleMap = {
    '1': 'Andrei',
    '2': 'Alex',
    '3': 'Florin',
  };

  Selector emotionSelector;
  Selector locationsSelector;
  Selector peopleSelector;

  String selectedEmotion;
  String selectedLocation;
  String selectedPersonId;

  List<Emotion> emotionList;

  EmotionService _emotionService;

  _SubmitEmotionRecordPageState() {
    // this.emotionSelector =
    //     new Selector(emotions, 'emotion', getDropDownEmotion);
    // this.locationsSelector =
    //     new Selector(locations, 'location', getDropDownLocation);
    this.selectedEmotion = "";
    this.selectedLocation = "";
    this.selectedPersonId = "";
    _emotionService = new EmotionService();
    this.peopleSelector =
        new Selector(peopleMap, 'person', getDropDownPersonId);
  }

  void getDropDownEmotion(String text) {
    this.selectedEmotion = text;
  }

  void getDropDownLocation(String text) {
    this.selectedLocation = text;
  }

  void getDropDownPersonId(String personId) {
    this.selectedPersonId = personId;
  }

  void getItems() async {
    var backendEmotions = await _emotionService.getEmotionsForCategory(
        "-1"); //TODO: change this to the emotion category once here
    this.setState(() {
      this.emotionList = backendEmotions;
      this.emotionSelector = new Selector(
          parseEmotionListToMap(backendEmotions),
          'emotion',
          getDropDownEmotion);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this._emotionService.getEmotionsForCategory("-1"), //change this
        builder: (context, snapshot) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xffffd1d1),
            ),
            home: Scaffold(
              body: snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SubmitEmotionRecordPageText(
                          'I felt',
                        ),
                        emotionSelector,
                        // SubmitEmotionRecordPageText(
                        //   'when I was at',
                        // ),
                        // locationsSelector,
                        // SubmitEmotionRecordPageText(
                        //   'with',
                        // ),
                        // peopleSelector,
                        Container(
                          child: ElevatedButton(
                            onPressed: onPressed,
                            child: const Text(
                              'Submit',
                              style: TextStyle(fontSize: 28),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.black.withOpacity(1);
                                  return Colors.black.withOpacity(0.5);
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }

  void onPressed() {
    print(selectedEmotion + " " + selectedLocation + " " + selectedPersonId);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CongratulationsPage()));
  }

  Map<String, String> parseEmotionListToMap(List<Emotion> emotionList) {
    Map<String, String> emotionMap = Map<String, String>();
    for (int index = 0; index < emotionList.length; index++) {
      emotionMap[emotionList[index].EmotionId] = emotionList[index].Name;
    }
    return emotionMap;
  }
}
