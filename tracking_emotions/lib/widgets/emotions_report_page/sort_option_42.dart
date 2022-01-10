import 'package:flutter/material.dart';
//import 'emotion_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: EmotionsReportPage(),
    );
  }
}

// ignore_for_file: prefer_const_constructors

class EmotionCard extends StatelessWidget {
  final String? heading;
  final String? subheading;
  final String? supportingText;
  final String? time;
  const EmotionCard(
      {Key? key, this.heading, this.subheading, this.supportingText, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                heading ?? 'default heading',
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green[700],
                child: Text(
                  heading![0],
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                radius: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                time ?? 'default time',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(supportingText ?? 'default subheading',
                  style: const TextStyle(fontSize: 25)),
            ),
            Container(
              padding: const EdgeInsets.all(13.0),
              alignment: Alignment.center,
              child: Text(
                subheading ?? 'default subheading',
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        ));
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MyHomePage({this.title = 'Tracking emotions report page'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class EmotionsReportPage extends StatelessWidget {
  const EmotionsReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        scaffoldBackgroundColor: const Color(0xffffd1d1),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 29.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Your tracked emotions'),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // var i = 0;
  //aici ar trebui să fie filtrate înainte listele, în funcție de ce se dorește să se afișeze
  static const emotions = [
    ["Wonderful", "Family", "At home", "time"],
    ["Sadness", "Job", "At office", "time"],
    ["Excitement", "Colleagues", "At home", "time"],
    ["test", "test", "test", "time"]
  ];

  static var filteredEmotions = [
    ["Wonderful", "Family", "At home", "time"],
    ["Sadness", "Job", "At office", "time"],
    ["Excitement", "Colleagues", "At home", "time"],
    ["test", "test", "test", "time"]
  ];
  String dropdownvalue = 'Job';

  // late String valueChoose;
  // // ignore: non_constant_identifier_names
  // List<String> listDropdownButton = ["Family", "Job", "Colleagues", "test"];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
// Initial Selected Value

    // List of items in our dropdown menu

    var items = ['Family', 'Job', 'Colleagues', 'test', 'ceva'];
    //ar trebui să ia al doilea (cu cine) element din fiecare listă din emotions.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text(widget.title),
      ),
      floatingActionButton: DropdownButton(
        // Initial Value
        value: dropdownvalue,
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),
        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),

        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
            filteredEmotions.clear();
            for (var i = 0; i < emotions.length; i++) {
              if (emotions[i][1] == dropdownvalue) {
                filteredEmotions.add(emotions[i]);
              }
            }
          });
        },
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: filteredEmotions.length,
              itemBuilder: (BuildContext context, int index) {
                return EmotionCard(
                    heading: filteredEmotions[index][0],
                    subheading: filteredEmotions[index][1],
                    supportingText: filteredEmotions[index][2],
                    time: filteredEmotions[index][3]);
              })),
    );
  }
}
