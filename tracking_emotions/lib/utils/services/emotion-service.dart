import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracking_emotions/models/emotion.dart';
import 'package:tracking_emotions/utils/services/tracking-emotions-http-requests.dart';

class EmotionService {
  TrackingEmotionsHttpRequests http;

  EmotionService() {
    http = new TrackingEmotionsHttpRequests('/emotions');
  }

  Future<List<Emotion>> getEmotionsForCategory(String categoryId) async {
    Map parameters = new Map();
    parameters['emotionCategoryID'] = categoryId;

    Response response =
        await http.fetchData(parameters, '/RetrieveEmotionsForCategory');

    if (response.statusCode == 200) {
      if (!response.body.isEmpty) {
        //todo: handle body errorCode
        Iterable emotionIterable = jsonDecode(response.body)['emotions'];
        return List<Emotion>.from(
            emotionIterable.map((e) => Emotion.fromJson(e)));
      } else {
        throw Exception("Failed to load Emotions");
      }
    }
  }
}
