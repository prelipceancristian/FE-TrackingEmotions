import 'package:tracking_emotions/utils/services/authentication-services/authentication-service-interface.dart';
import 'package:tracking_emotions/utils/services/authentication-services/default-authentication-service.dart';
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

  Future<bool> login(String username, String password) async {
    return await authenticationService.login(username, password);
  }

  void initializeGoogleAuthentication() {
    this.authenticationService = new GoogleAuthenticationService();
  }

  void initializeFacebookAuthentication() {
    this.authenticationService = new FacebookAuthenticationService();
  }

  void initializeDefaultAuthentication() {
    this.authenticationService = new DefaultAuthenticationService();
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
    final DefaultAuthenticationService defaultAuthenticationService =
        new DefaultAuthenticationService();

    if (await googleAuthenticationService.isSignedIn()) {
      this.authenticationService = googleAuthenticationService;
    }

    if (await facebookAuthenticationService.isSignedIn()) {
      this.authenticationService = facebookAuthenticationService;
    }

    if (await defaultAuthenticationService.isSignedIn()) {
      this.authenticationService = defaultAuthenticationService;
    }
  }
}
