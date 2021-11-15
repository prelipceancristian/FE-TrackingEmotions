abstract class AuthenticationServiceInterface {
  Future<bool> isSignedIn();
  Future<bool> login();
  Future<dynamic> logOut();
  String getName();
  String getEmail();
  String getPhotoUrl();
  String getAccountId();
}
