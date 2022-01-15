import 'package:flutter/material.dart';
import 'package:tracking_emotions/models/emotion.dart';
import 'package:tracking_emotions/models/social-environment.dart';
import 'package:tracking_emotions/utils/services/Emotion-service.dart';
import 'package:tracking_emotions/utils/services/social-environment-service.dart';

import 'package:tracking_emotions/widgets/after-submit/congratiulations-page.dart';

import './selector.dart';
import 'submitEmotionRecordPageText.dart';

class SubmitEmotionRecordPage extends StatefulWidget {
  String _categoryId;

  SubmitEmotionRecordPage() {
    this._categoryId = "-1";
  }

  SubmitEmotionRecordPage.fromCategory(String _categoryId) {
    this._categoryId = _categoryId;
  }
  @override
  _SubmitEmotionRecordPageState createState() =>
      _SubmitEmotionRecordPageState.fromCategory(_categoryId);
}

class _SubmitEmotionRecordPageState extends State<SubmitEmotionRecordPage> {
  String _categoryId;

  Selector emotionSelector;
  Selector locationsSelector;
  Selector peopleSelector;

  String selectedEmotion;
  String selectedLocation;
  String selectedPersonId;

  // List<Emotion> emotionList;
  // List<SocialEnvironment> locationList;
  // List<SocialEnvironment> peopleList;

  EmotionService _emotionService;
  SocialEnvironmentService _socialEnvironmentService;

  _SubmitEmotionRecordPageState.fromCategory(String categoryId) {
    this._categoryId = categoryId;
    this.selectedEmotion = "";
    this.selectedLocation = "";
    this.selectedPersonId = "";
    _emotionService = new EmotionService();
    _socialEnvironmentService = new SocialEnvironmentService();
  }

  _SubmitEmotionRecordPageState() {
    //this might not be necessary
    this._categoryId = "-1";
    this.selectedEmotion = "";
    this.selectedLocation = "";
    this.selectedPersonId = "";
    _emotionService = new EmotionService();
    _socialEnvironmentService = new SocialEnvironmentService();
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

  Future<int> getItems() async {
    print(_categoryId);
    var backendEmotions = await _emotionService.getEmotionsForCategory(
        _categoryId); //TODO: change this to the emotion category once here
    var backendLocations =
        await _socialEnvironmentService.getSocialEnvironmentsByType(true);
    var backendPeople =
        await _socialEnvironmentService.getSocialEnvironmentsByType(false);

    this.setState(() {
      // this.emotionList = backendEmotions;
      this.emotionSelector = new Selector(
          parseEmotionListToMap(backendEmotions),
          'emotion',
          getDropDownEmotion);
      this.locationsSelector = new Selector(
          parseSocialEnvironmentListToMap(backendLocations),
          'location',
          getDropDownLocation);
      this.peopleSelector = new Selector(
          parseSocialEnvironmentListToMap(backendPeople),
          'person',
          getDropDownPersonId);
    });
    var length =
        backendEmotions.length + backendLocations.length + backendPeople.length;
    return length;
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
        future: _emotionService.getEmotionsForCategory(
            _categoryId), //TODO: change this category and improve the future
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

  Map<String, String> parseSocialEnvironmentListToMap(
      List<SocialEnvironment> socialEnvironmentList) {
    for (int i = 0; i < socialEnvironmentList.length; i++) {
      print(socialEnvironmentList[i].SocialEnvironmentId);
    }
    Map<String, String> socialEnvironmentMap = Map<String, String>();
    for (int index = 0; index < socialEnvironmentList.length; index++) {
      socialEnvironmentMap[socialEnvironmentList[index].SocialEnvironmentId] =
          socialEnvironmentList[index].Relation;
      // print(socialEnvironmentList[index].SocialEnvironmentId);
      // print(socialEnvironmentList[index].Relation);
    }
    return socialEnvironmentMap;
  }
}
