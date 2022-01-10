import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracking_emotions/utils/constants.dart';

import '../login-page.dart';

void main() {
  runApp(RegisterPage());
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  Widget buildUsernameField() {
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
            controller: nameController,
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
                color: Color.fromARGB(255, 249, 187, 178),
              ),
              hintText: 'Username',
              hintStyle: cHintTextStyle,
            ),
          ),
        ])
      ],
    );
  }

  Widget buildEmailField() {
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
            controller: emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.name,
            validator: (value) {
              return value == "" ? 'Email can\'t be empty!' : null;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                IconData(0xe22a, fontFamily: 'MaterialIcons'),
                color: Color.fromARGB(255, 249, 187, 178),
              ),
              hintText: 'Email',
              hintStyle: cHintTextStyle,
            ),
          ),
        ])
      ],
    );
  }

  Widget buildPasswordField() {
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
            controller: passwordController,
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
                color: Color.fromARGB(255, 249, 187, 178),
              ),
              hintText: 'Password',
              hintStyle: cHintTextStyle,
            ),
          ),
        ]),
      ],
    );
  }

  Widget buildConfirmPasswordField() {
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
            controller: confirmPasswordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
            validator: (value) {
              return value == "" ? 'Passwords do not march!' : null;
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
                color: Color.fromARGB(255, 249, 187, 178),
              ),
              hintText: 'Confirm Password',
              hintStyle: cHintTextStyle,
            ),
          ),
        ]),
      ],
    );
  }

  Widget buildLoginBtn() {
    return GestureDetector(
      onTap: () => {
        // TODO: add a route to register page
        loginFormKey.currentState.validate(),
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())),
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login here',
              style: TextStyle(
                color: Color.fromARGB(255, 249, 187, 178),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterBtn() {
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
          primary: Color.fromARGB(255, 249, 187, 178),
        ),
        onPressed: () => {
          //TODO: REGISTER
          loginFormKey.currentState.validate(),
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
        },
        child: Text(
          'REGISTER',
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
                color: Color.fromARGB(255, 250, 237, 227),
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
                          'REGISTER',
                          style: TextStyle(
                            color: Color.fromARGB(255, 249, 187, 178),
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        buildUsernameField(),
                        SizedBox(height: 20.0),
                        buildEmailField(),
                        SizedBox(height: 20.0),
                        buildPasswordField(),
                        SizedBox(height: 20.0),
                        buildConfirmPasswordField(),
                        SizedBox(height: 20.0),
                        buildLoginBtn(),
                        SizedBox(height: 20.0),
                        buildRegisterBtn(),
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
