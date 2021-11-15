// THIS WIDGET IS JUST FOR TESTING!
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-controller.dart';
import 'package:tracking_emotions/widgets/login-page.dart';

class UserInformationScreen extends StatefulWidget {
  AuthenticationController authenticationController;
  UserInformationScreen() {}
  @override
  _UserInformationScreenState createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  String userData = "nimic";

  AuthenticationController authenticationController;

  String prettyPrint(Map json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  _UserInformationScreenState() {
    this.authenticationController = new AuthenticationController();
  }

  void getUserData() {
    this.userData = authenticationController.getName();
  }

  @override
  void initState() {
    super.initState();
    getUserData();
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
                    key: loginFormKey,
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
                        Text(userData),
                        SizedBox(height: 20),
                        CupertinoButton(
                          color: Colors.blue,
                          child: Text(
                            "LOGOUT",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async => {
                            await authenticationController.logOut(),
                            if (Navigator.canPop(context))
                              {Navigator.pop(context)},
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()))
                          },
                        ),
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
