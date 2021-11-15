import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-service-interface.dart';

class GoogleAuthenticationService implements AuthenticationServiceInterface {
  GoogleSignInAccount _googleAccount;

  static final GoogleAuthenticationService _googleAuthenticationService =
      GoogleAuthenticationService.internal();

  factory GoogleAuthenticationService() {
    return _googleAuthenticationService;
  }

  GoogleAuthenticationService.internal() {}

  @override
  Future<bool> isSignedIn() async {
    final bool isSignedIn = await GoogleSignIn().isSignedIn();

    if (isSignedIn) {
      this._googleAccount = await GoogleSignIn().signInSilently();
    }

    return await GoogleSignIn().isSignedIn();
  }

  @override
  Future logOut() async {
    await GoogleSignIn().disconnect();
    this._googleAccount = null;
  }

  @override
  Future<bool> login() async {
    final googleAccount = await GoogleSignIn().signIn();

    if (googleAccount != null) {
      this._googleAccount = googleAccount;
      print(googleAccount.toString());
      return true;
    }

    return false;
  }

  @override
  String getName() {
    return this._googleAccount.displayName;
  }

  @override
  String getEmail() {
    return this._googleAccount.email;
  }

  @override
  String getPhotoUrl() {
    return this._googleAccount.photoUrl;
  }

  @override
  String getAccountId() {
    return this._googleAccount.id;
  }
}
