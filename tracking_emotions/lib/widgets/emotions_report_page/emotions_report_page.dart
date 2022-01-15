import 'package:flutter/material.dart';
import 'package:tracking_emotions/models/emotion-log-descriptor.dart';
import 'package:tracking_emotions/models/emotion-log.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-controller.dart';
import 'package:tracking_emotions/utils/services/emotion-log-service.dart';
import 'package:tracking_emotions/widgets/emotions_report_page/emotion_card.dart';

class EmotionsReportPage extends StatefulWidget {
  const EmotionsReportPage({Key key, String title}) : super(key: key);

  final String title = 'Your tracked emotions';

  @override
  State<EmotionsReportPage> createState() => _EmotionsReportPageState();
}

class _EmotionsReportPageState extends State<EmotionsReportPage> {
  List<EmotionCard> emotions;

  // final emotions = [
  //   EmotionCard(
  //       heading: 'Wonderful',
  //       subheading: 'Family',
  //       supportingText: 'At home',
  //       time: 'time'),
  //   EmotionCard(
  //       heading: 'Saddness',
  //       subheading: 'Job',
  //       supportingText: 'At office',
  //       time: 'time'),
  //   EmotionCard(
  //       heading: 'test',
  //       subheading: 'test',
  //       supportingText: 'test',
  //       time: 'time'),
  //   EmotionCard(
  //       heading: 'asalut',
  //       subheading: 'ae bun',
  //       supportingText: 'ba',
  //       time: 'time'),
  // ];

  AuthenticationController _authenticationController;
  EmotionLogService _emotionLogService;

  Future<List<EmotionCard>> getEmotionLogsForUser() async {
    String userId = _authenticationController.getAccountId();
    List<EmotionCard> emotionCardList = [];

    List<EmotionLogDescriptor> emotionLogs =
        await _emotionLogService.getEmotionLogsForUser(userId);

    for (int i = 0; i < emotionLogs.length; i++) {
      print(emotionLogs.elementAt(i).toString());
    }

    for (int index = 0; index < emotionLogs.length; index++) {
      var temp = EmotionCard(
          heading: emotionLogs[index].EmotionName,
          subheading: emotionLogs[index].SocialEnvironment1,
          supportingText: emotionLogs[index].SocialEnvironment2,
          time: emotionLogs[index].Date);
      emotionCardList.add(temp);
    }
    return emotionCardList;
  }

  _EmotionsReportPageState() {
    this._authenticationController = new AuthenticationController();
    this._emotionLogService = new EmotionLogService();
    this.emotions = [];
  }

  void getItems() async {
    var emotionLogs = await this.getEmotionLogsForUser();
    this.setState(() {
      this.emotions = emotionLogs;
    });
  }

  @override
  initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () async {
              final option = await showDialog<String>(
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Color.fromARGB(255, 249, 187, 178),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Sort by:',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          TextButton(
                            child: Text(
                              'Emotion',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () =>
                                Navigator.of(context).pop('emotion'),
                          ),
                          TextButton(
                            child: Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () =>
                                Navigator.of(context).pop('location'),
                          ),
                          TextButton(
                            child: Text(
                              'Date',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop('date'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

              if (option == 'emotion') {
                emotions.sort((a, b) =>
                    a.heading.toLowerCase().compareTo(b.heading.toLowerCase()));
              } else if (option == 'location') {
                emotions.sort((a, b) => a.supportingText
                    .toLowerCase()
                    .compareTo(b.supportingText.toLowerCase()));
              } else if (option == 'date') {
                emotions.sort((a, b) => DateTime.tryParse(b.time)
                    .compareTo(DateTime.tryParse(a.time)));
              }
              if (option != null) {
                setState(() {});
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: _emotionLogService
              .getEmotionLogsForUser(_authenticationController.getAccountId()),
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.connectionState != ConnectionState.done
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(18.0),
                    child: ListView.builder(
                      itemCount: emotions.length,
                      itemBuilder: (BuildContext context, int index) =>
                          emotions[index],
                    ),
                  );
          }),
    );
  }
}
