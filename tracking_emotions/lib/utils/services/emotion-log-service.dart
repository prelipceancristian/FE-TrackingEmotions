import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracking_emotions/models/emotion-log-descriptor.dart';
import 'package:tracking_emotions/models/emotion-log.dart';
import 'package:tracking_emotions/utils/services/tracking-emotions-http-requests.dart';
import 'package:intl/intl.dart';

class EmotionLogService {
  TrackingEmotionsHttpRequests http;

  EmotionLogService() {
    http = new TrackingEmotionsHttpRequests('/emotionLogs');
  }

  Future<bool> submitEmotionLog(EmotionLog emotionLog) async {
    Map parameters = new Map();

    parameters['userID'] = emotionLog.UserID;
    parameters['emotionID'] = emotionLog.EmotionID;
    parameters['socialEnvironmentID1'] = emotionLog.SocialEnvironmentID1;
    parameters['socialEnvironmentID2'] = emotionLog.SocialEnvironmentID2;
    parameters['date'] =
        DateFormat('yyyy-MM-dd').format(emotionLog.Date); //TODO: check this

    Response response = await http.postData(parameters, '');

    if (response.statusCode == 200) {
      return true;
    } else {
      //throw Exception('Failed to submit emotion');
      return false;
    }
  }

  Future<List<EmotionLogDescriptor>> getEmotionLogsForUser(
      String userId) async {
    Map parameters = new Map();
    parameters['userID'] = userId;

    Response response = await http.fetchData(parameters, '/descriptors');

    if (response.statusCode == 200) {
      if (!response.body.isEmpty) {
        //todo: handle body errorCode
        Iterable emotionLogIterable = jsonDecode(response.body);
        for (int i = 0; i < emotionLogIterable.length; i++) {
          print(emotionLogIterable.elementAt(i).toString());
        }
        var asd = List<EmotionLogDescriptor>.from(
            emotionLogIterable.map((e) => EmotionLogDescriptor.fromJson(e)));
        for (int i = 0; i < asd.length; i++) {
          print(asd.elementAt(i).toString());
        }
        return List<EmotionLogDescriptor>.from(
            emotionLogIterable.map((e) => EmotionLogDescriptor.fromJson(e)));
      } else {
        throw Exception("Failed to load Emotion Descriptors");
      }
    }
  }
}
