import 'package:flutter/material.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-controller.dart';
import 'package:tracking_emotions/widgets/login-page.dart';

class UserDetailsPage extends StatelessWidget {
  AuthenticationController _authenticationController =
      new AuthenticationController();

  String _getProfilePhoto() {
    final result = _authenticationController.getPhotoUrl();
    if (result != null) {
      return result;
    } else {
      return '';
    }
  }

  String _getName() {
    return "Name: " + _authenticationController.getName();
  }

  String _getEmail() {
    return "Email: " + _authenticationController.getEmail();
  }

  Future<dynamic> _logOut(BuildContext context) async {
    await _authenticationController.logOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 237, 227),
      body: Column(
        children: [
          Container(
              child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 150.0),
            height: 350.0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: this._getProfilePhoto().isNotEmpty
                        ? NetworkImage(
                            _getProfilePhoto(),
                          )
                        : AssetImage('assets/icons/user_page.jpg'),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    this._getName(),
                    style: TextStyle(fontSize: 22.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      this._getEmail(),
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            height: 20.0,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: 300.00,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: Color.fromARGB(255, 128, 89, 89),
                      ),
                      onPressed: () async => {this._logOut(context)},
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
