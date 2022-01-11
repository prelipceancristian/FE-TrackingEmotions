import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracking_emotions/models/emotion-category.dart';

import 'tracking-emotions-http-requests.dart';

class CategoryService {
  TrackingEmotionsHttpRequests http;

  CategoryService() {
    http = new TrackingEmotionsHttpRequests('/emotionCategory');
  }

  Future<List<EmotionCategory>> getCategory(int valence) async {
    Map parameters = new Map();

    parameters['valence'] = valence;

    Response response =
        await http.fetchData(parameters, '/RetrieveCategoriesForValence');

    if (response.statusCode == 200) {
      Iterable emotionCategoryIterable =
          jsonDecode(response.body)['emotionCategoryList'];

      return List<EmotionCategory>.from(emotionCategoryIterable
          .map((emotionCategory) => EmotionCategory.fromJson(emotionCategory)));
    } else {
      throw Exception('Failed to load EmotionCategory');
    }
  }
}
