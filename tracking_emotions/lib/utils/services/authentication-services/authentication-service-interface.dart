abstract class AuthenticationServiceInterface {
  Future<bool> isSignedIn();
  Future<bool> login(String username, String password);
  Future<dynamic> logOut();
  String getName();
  String getEmail();
  String getPhotoUrl();
  String getAccountId();
}
