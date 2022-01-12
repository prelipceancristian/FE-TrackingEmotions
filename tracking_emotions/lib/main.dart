import 'package:flutter/material.dart';
import 'package:tracking_emotions/utils/services/authentication-services/authentication-controller.dart';
import 'package:tracking_emotions/widgets/homepage/MyStatefulWidget.dart';
import 'widgets/login-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking Emotions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthenticationController authenticationController = new AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: authenticationController.isSignedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> isSignedIn) {
        if (isSignedIn.hasData && isSignedIn.data == true) {
          return MyStatefulWidget();
        }
        return LoginScreen();
      },
    );
  }
}
