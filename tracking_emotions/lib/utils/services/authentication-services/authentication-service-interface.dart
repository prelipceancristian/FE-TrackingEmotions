abstract class AuthenticationServiceInterface {
  Future<bool> isSignedIn();
  Future<bool> login();
  Future logOut();
  String getName();
  String getEmail();
  String getPhotoUrl();
  String getAccountId();
}
