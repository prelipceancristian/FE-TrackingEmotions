import 'package:http/http.dart' as http;

class TrackingEmotionsHttpRequests {
  String url = 'http://10.0.2.2:8080/api';

  TrackingEmotionsHttpRequests(url) {
    this.url += url;
  }

  Future<http.Response> fetchData(Map parameters, String additionalUrl) async {
    int index = 0;
    String formattedUrl = this.url + additionalUrl + '?';
    parameters.forEach((key, value) {
      if (index > 1) {
        formattedUrl += '&';
      }
      formattedUrl += key.toString() + '=' + value.toString();
      index += 1;
    });
    return await http.get(Uri.parse(formattedUrl));
  }

  Future<http.Response> postData(Map parameters, String additionalUrl) async {
    int index = 0;
    String formattedUrl = this.url + additionalUrl + '?';
    parameters.forEach((key, value) {
      if (index > 1) {
        formattedUrl += '&';
      }
      formattedUrl += key.toString() + '=' + value.toString();
      index += 1;
    });
    return await http.post(Uri.parse(formattedUrl));
  }

  Future<http.Response> deleteData(Map parameters, String additionalUrl) async {
    int index = 0;
    String formattedUrl = this.url + additionalUrl + '?';
    parameters.forEach((key, value) {
      if (index > 1) {
        formattedUrl += '&';
      }
      formattedUrl += key.toString() + '=' + value.toString();
      index += 1;
    });
    return await http.delete(Uri.parse(formattedUrl));
  }

  Future<http.Response> putData(Map parameters, String additionalUrl) async {
    int index = 0;
    String formattedUrl = this.url + additionalUrl + '?';
    parameters.forEach((key, value) {
      if (index > 1) {
        formattedUrl += '&';
      }
      formattedUrl += key.toString() + '=' + value.toString();
      index += 1;
    });
    return await http.put(Uri.parse(formattedUrl));
  }
}
