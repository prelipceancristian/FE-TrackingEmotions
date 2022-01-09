import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracking_emotions/models/emotion.dart';

import 'tracking-emotions-http-requests.dart';

class EmotionService {
  TrackingEmotionsHttpRequests http;

  EmotionService() {
    http = new TrackingEmotionsHttpRequests('/emotion');
  }

//gets all the emotions from the backend
  Future<List<Emotion>> getEmotions() async {
    Map parameters = new Map();

    Response response = await http.fetchData(parameters, '/Emotions');

    if (response.statusCode == 200) {
      Iterable emotionsIterable = jsonDecode(response.body)['emotionList'];

      return List<Emotion>.from(
          emotionsIterable.map((emotions) => Emotion.fromJson(emotions)));
    } else {
      throw Exception('Failed to load Emotions');
    }
  }
}
