import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

void main() {
  runApp(ChooseCategory());
}

class ChooseCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Extra pozitiv"), value: "ExtraPozitiv"),
      DropdownMenuItem(child: Text("Putin Pozitiv"), value: "PutinPozitiv"),
      DropdownMenuItem(child: Text("Mai Mult Neutru"), value: "MaiMultNeutru"),
    ];
    return menuItems;
  }

  String selectedValue = "ExtraPozitiv";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: Container(
        child: Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(top: 150.0),
                  child: BubbleSpecialTwo(
                    text: 'In which category does it fit in?',
                    isSender: false,
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(top: 100.0),
                  child: BubbleSpecialTwo(
                    text: '  ...  ',
                    isSender: true,
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                margin: EdgeInsets.only(top: 300),
                decoration:
                    BoxDecoration(color: Color.fromRGBO(156, 80, 82, 1)),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                    ),
                    Container(
                      width: 350,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          dropdownColor: Colors.white,
                          onChanged: (String newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          value: selectedValue,
                          items: dropdownItems),
                    ),
                    new Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 20),
                      child: new TextButton(
                        onPressed: () {
                          print('Pressed!');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseCategory()));
                          //:TODO Send to next screen
                        },
                        child: Text(
                          "Mai departe",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
