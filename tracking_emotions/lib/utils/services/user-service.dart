import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracking_emotions/models/user.dart';

import 'tracking-emotions-http-requests.dart';

class UserService {
  TrackingEmotionsHttpRequests http;

  UserService() {
    http = new TrackingEmotionsHttpRequests('/user');
  }

  Future<User> login(String username, String password) async {
    Map parameters = new Map();

    parameters['Username'] = username;
    parameters['Password'] = password;

    Response response = await http.fetchData(parameters, '/login');

    if (response.statusCode == 200) {
      return response.body.isNotEmpty
          ? User.fromJson(jsonDecode(response.body))
          : null;
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<User> getUserDetails(int userId) async {
    Map parameters = new Map();
    String getUserUri = '/' + userId.toString();

    Response response = await http.fetchData(parameters, getUserUri);

    if (response.statusCode == 200) {
      return response.body.isNotEmpty
          ? User.fromJson(jsonDecode(response.body))
          : null;
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<bool> socialLogin(User socialUser) async {
    Map parameters = new Map();

    parameters['UserId'] = socialUser.UserId;
    parameters['FirstName'] = socialUser.FirstName;
    parameters['Email'] = socialUser.Email;

    Response response = await http.postData(parameters, '/socialLogin');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<bool> registerUser(User user) async {
    Map parameters = new Map();

    parameters['Email'] = user.Email;
    parameters['Username'] = user.Username;
    parameters['Password'] = user.Password;
    parameters['FirstName'] = '';
    parameters['LastName'] = '';
    parameters['BirthDate'] = '';
    parameters['Gender'] = '';

    Response response = await http.postData(parameters, '');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load User');
    }
  }
}
