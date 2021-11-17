import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int selectedPage = 0;

  final _pageOptions = [HomeScreen(), HomeScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[selectedPage],
        backgroundColor: Color.fromRGBO(238, 150, 96, 1.0),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconData(0xea39, fontFamily: 'MaterialIcons')),
                  label: 'Stats'),
              BottomNavigationBarItem(
                  icon: Icon(IconData(61267, fontFamily: 'MaterialIcons')),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(IconData(63647, fontFamily: 'MaterialIcons')),
                  label: 'Emotions')
            ],
            selectedItemColor: Color.fromRGBO(255, 103, 83, 1.0),
            elevation: 5.0,
            unselectedItemColor: Color.fromRGBO(255, 165, 117, 1.0),
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            unselectedLabelStyle: TextStyle(fontSize: 15),
            currentIndex: selectedPage,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            }));
  }
}
