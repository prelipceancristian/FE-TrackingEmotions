import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracking_emotions/MyStatefulWidget.dart';
import 'package:tracking_emotions/utils/constants.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-controller.dart';
import 'package:tracking_emotions/widgets/homepage/MyStatefulWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  AuthenticationController _authenticationController =
      new AuthenticationController();
  final _loginFormKey = GlobalKey<FormState>();

  Widget buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Stack(children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: cBoxDecorationStyle,
            height: 50.0,
          ),
          TextFormField(
            controller: _usernameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.name,
            validator: (value) {
              return value == "" ? 'Username can\'t be empty!' : null;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Username',
              hintStyle: cHintTextStyle,
            ),
          ),
        ])
      ],
    );
  }

  Widget buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Stack(children: [
          Container(
              alignment: Alignment.centerLeft,
              decoration: cBoxDecorationStyle,
              height: 50.0),
          TextFormField(
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
            validator: (value) {
              return value == "" ? 'Password can\'t be empty!' : null;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Password',
              hintStyle: cHintTextStyle,
            ),
          ),
        ]),
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
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
        onPressed: () => {
          //TODO: add login functionality
          _loginFormKey.currentState.validate(),
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyStatefulWidget())),
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget buildSignupBtn() {
    return GestureDetector(
      onTap: () => {
        // TODO: add a route to register page
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Register here',
              style: TextStyle(
                color: Color.fromARGB(255, 191, 134, 134),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: cLabelStyle,
        ),
      ],
    );
  }

  Widget buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildSocialBtn(
            () async => {await _connectWithFacebook()},
            AssetImage(
              'assets/icons/facebook.jpg',
            ),
          ),
          buildSocialBtn(
            () async => {await _connectWithGoogle()},
            AssetImage(
              'assets/icons/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _connectWithGoogle() async {
    _authenticationController.initializeGoogleAuthentication();
    final result = await _authenticationController.login();
    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyStatefulWidget()),
      );
    }
  }

  Future<dynamic> _connectWithFacebook() async {
    _authenticationController.initializeFacebookAuthentication();
    final result = await _authenticationController.login();
    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyStatefulWidget()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Color.fromARGB(255, 255, 209, 209),
              ),
              Center(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        buildUsernameTF(),
                        SizedBox(height: 20.0),
                        buildPasswordTF(),
                        SizedBox(height: 20.0),
                        buildSignupBtn(),
                        buildLoginBtn(),
                        SizedBox(height: 20.0),
                        buildSignInWithText(),
                        buildSocialBtnRow()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
