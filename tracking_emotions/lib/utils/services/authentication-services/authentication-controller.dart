import 'package:tracking_emotions/utils/services/authentication-services/authentication-service-interface.dart';
import 'package:tracking_emotions/utils/services/authentication-services/facebook-authentication-service.dart';
import 'package:tracking_emotions/utils/services/authentication-services/google-authentication-service.dart';

class AuthenticationController {
  AuthenticationServiceInterface authenticationService;

  static final AuthenticationController authenticationController =
      AuthenticationController.internal();

  factory AuthenticationController() {
    return authenticationController;
  }

  AuthenticationController.internal();

  Future<bool> isSignedIn() async {
    await initializeAuthenticationMetod();
    if (authenticationService != null) {
      return authenticationService.isSignedIn();
    }

    return false;
  }

  Future<dynamic> logOut() async {
    await authenticationService.logOut();
  }

  Future<bool> login() async {
    return await authenticationService.login();
  }

  void initializeGoogleAuthentication() {
    this.authenticationService = new GoogleAuthenticationService();
  }

  void initializeFacebookAuthentication() {
    this.authenticationService = new FacebookAuthenticationService();
  }

  String getName() {
    return this.authenticationService.getName();
  }

  String getEmail() {
    return this.authenticationService.getEmail();
  }

  String getPhotoUrl() {
    return this.authenticationService.getPhotoUrl();
  }

  String getAccountId() {
    return this.authenticationService.getAccountId();
  }

  Future<dynamic> initializeAuthenticationMetod() async {
    final GoogleAuthenticationService googleAuthenticationService =
        new GoogleAuthenticationService();
    final FacebookAuthenticationService facebookAuthenticationService =
        new FacebookAuthenticationService();

    if (await googleAuthenticationService.isSignedIn()) {
      this.authenticationService = googleAuthenticationService;
    }

    if (await facebookAuthenticationService.isSignedIn()) {
      this.authenticationService = facebookAuthenticationService;
    }
  }
}
