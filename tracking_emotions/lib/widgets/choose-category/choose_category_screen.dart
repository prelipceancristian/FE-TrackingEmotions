import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:tracking_emotions/models/emotion-category.dart';
import 'package:tracking_emotions/utils/services/category-service.dart';
import 'package:tracking_emotions/widgets/submit_emotion_record_page/submitEmotionRecordPage.dart';

class ChooseCategory extends StatelessWidget {
  int _valence;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      home: HomePage(this._valence),
    );
  }

  ChooseCategory(int valence) {
    this._valence = valence;
  }
}

class HomePage extends StatefulWidget {
  int _valence;
  HomePage(int valence) {
    this._valence = valence;
  }

  @override
  _HomePageState createState() => _HomePageState(this._valence);
}

class _HomePageState extends State<HomePage> {
  int _valence;

  _HomePageState(int valence) {
    this._valence = valence;
  }

  CategoryService _categoryService = new CategoryService();

  List<DropdownMenuItem<String>> menuItems;

  Future<List<DropdownMenuItem<String>>> getDropdownItems() async {
    List<DropdownMenuItem<String>> menuItems = [];
    List<EmotionCategory> emotionCategoryList =
        await this._categoryService.getCategory(this._valence);

    emotionCategoryList.forEach((emotionCategory) {
      menuItems.add(DropdownMenuItem(
          child: Text(emotionCategory.Name),
          value: emotionCategory.EmotionCategoryID.toString()));
    });
    return menuItems;
  }

  String selectedValue = "";

  setMenuItems() async {
    var backendMenuItems = await getDropdownItems();
    this.setState(() {
      menuItems = backendMenuItems;
      selectedValue = menuItems.first.value;
    });
  }

  @override
  void initState() {
    setMenuItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 250, 237, 227),
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
                    BoxDecoration(color:Color.fromARGB(255, 249, 187, 178) ),
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
                          items: menuItems),
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
                                  builder: (context) =>
                                      SubmitEmotionRecordPage()));
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
