import 'package:http/http.dart' as http;

class TrackingEmotionsHttpRequests {
  String url;

  TrackingEmotionsHttpRequests(url) {
    this.url = url;
  }

  Future<http.Response> fetchData(Map parameters) async {
    String formattedUrl = url + '?';
    parameters.forEach((key, value) {
      formattedUrl += key.toString() + '=' + value.toString();
    });
    final response = await http.get(Uri.parse(formattedUrl));
    return response;
  }

  Future<http.Response> postData(Map parameters) async {
    String formattedUrl = url + '?';
    parameters.forEach((key, value) {
      formattedUrl += key + '=' + value;
    });
    final response = await http.post(Uri.parse(formattedUrl));
    return response;
  }

  Future<http.Response> deleteData(Map parameters) async {
    String formattedUrl = url + '?';
    parameters.forEach((key, value) {
      formattedUrl += key + '=' + value;
    });
    final response = await http.delete(Uri.parse(formattedUrl));
    return response;
  }

  Future<http.Response> putData(Map parameters) async {
    String formattedUrl = url + '?';
    parameters.forEach((key, value) {
      formattedUrl += key + '=' + value;
    });
    final response = await http.put(Uri.parse(formattedUrl));
    return response;
  }
}
