import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-service-interface.dart';

class FacebookAuthenticationService implements AuthenticationServiceInterface {
  Map<String, dynamic> _userData;
  static final FacebookAuthenticationService _facebookAuthenticationService =
      FacebookAuthenticationService.internal();

  factory FacebookAuthenticationService() {
    return _facebookAuthenticationService;
  }

  FacebookAuthenticationService.internal();

  @override
  Future<bool> isSignedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    if (accessToken != null) {
      this._userData = await FacebookAuth.instance.getUserData();
      return true;
    }

    return false;
  }

  @override
  Future<dynamic> logOut() async {
    await FacebookAuth.instance.logOut();
    this._userData = null;
  }

  @override
  Future<bool> login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      this._userData = userData;
      return true;
    }

    return false;
  }

  @override
  String getName() {
    return _userData['name'];
  }

  @override
  String getEmail() {
    return _userData['email'];
  }

  @override
  String getPhotoUrl() {
    return _userData['picture']['data']['url'];
  }

  @override
  String getAccountId() {
    return _userData['id'];
  }
}
