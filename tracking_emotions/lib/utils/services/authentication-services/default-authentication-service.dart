import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_emotions/models/user.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-service-interface.dart';
import '../user-service.dart';

class DefaultAuthenticationService implements AuthenticationServiceInterface {
  User _userData;
  FlutterSecureStorage _localStorage = new FlutterSecureStorage();
  UserService _userService = new UserService();

  static final DefaultAuthenticationService _defaultAuthenticationService =
      DefaultAuthenticationService.internal();

  factory DefaultAuthenticationService() {
    return _defaultAuthenticationService;
  }

  DefaultAuthenticationService.internal();

  @override
  Future<bool> isSignedIn() async {
    String userId = await this._localStorage.read(key: 'userId');
    if (userId != null) {
      this._userData =
          await this._userService.getUserDetails(int.parse(userId));
      return true;
    }

    return false;
  }

  @override
  Future<dynamic> logOut() async {
    await _localStorage.delete(key: 'userId');
    _userData = null;
  }

  @override
  Future<bool> login(String username, String password) async {
    final User userLogged = await this._userService.login(username, password);

    if (userLogged != null) {
      this._userData = userLogged;
      await _localStorage.write(key: 'userId', value: userLogged.UserId);
      return true;
    }

    return false;
  }

  @override
  String getAccountId() {
    return this._userData.UserId;
  }

  @override
  String getEmail() {
    return this._userData.Email;
  }

  @override
  String getName() {
    return this._userData.Username;
  }

  @override
  String getPhotoUrl() {
    return '';
  }
}
