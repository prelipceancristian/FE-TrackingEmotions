import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracking_emotions/models/emotion.dart';
import 'package:tracking_emotions/models/social-environment.dart';
import 'package:tracking_emotions/utils/services/tracking-emotions-http-requests.dart';

class SocialEnvironmentService {
  TrackingEmotionsHttpRequests http;

  SocialEnvironmentService() {
    http = new TrackingEmotionsHttpRequests('/socialEnvironments');
  }

  Future<List<SocialEnvironment>> getSocialEnvironmentsByType(
      bool isLocation) async {
    Map parameters = new Map();

    Response response =
        await http.fetchData(parameters, isLocation ? "/locations" : "/people");

    if (response.statusCode == 200) {
      if (!response.body.isEmpty) {
        print(response.body);
        Iterable environmentIterable = jsonDecode(response.body);
        return List<SocialEnvironment>.from(
            environmentIterable.map((e) => SocialEnvironment.fromJson(e)));
      } else {
        throw Exception("Failed to load Environments");
      }
    }
  }
}
