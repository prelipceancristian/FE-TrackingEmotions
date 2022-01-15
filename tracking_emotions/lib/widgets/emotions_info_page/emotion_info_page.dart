import 'package:flutter/material.dart';
import 'package:tracking_emotions/models/emotion.dart';
import 'package:tracking_emotions/utils/services/Emotion-service.dart';

class EmotionInfoPage extends StatelessWidget {
  const EmotionInfoPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  EmotionService _emotionService = EmotionService();
  var _controller = TextEditingController();

  Future<List<Map<String, dynamic>>> getEmotions() async {
    List<Map<String, dynamic>> menuItems = [];
    List<Emotion> emotionList =
        await this._emotionService.getEmotionsForCategory("-1");

    emotionList.forEach((emotion) {
      menuItems.add({
        "id": emotion.EmotionId,
        "name": emotion.Name,
        "description": emotion.DescriptionText,
        "descriptionId": emotion.DescriptionId
        //TO DO: must bring the text Description here!!
      });
    });
    return menuItems;
  }

  @override
  initState() {
    // at the beginning, all users are shown
    setMenuItems();
    super.initState();
  }

  setMenuItems() async {
    var backendMenuItems = await getEmotions();
    print(backendMenuItems);
    this.setState(() {
      _allUsers = backendMenuItems;
      _foundUsers = _allUsers;
    });
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  void clear() {
    _controller.clear();
    _runFilter(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 237, 227),
      body: FutureBuilder(
          future: _emotionService.getEmotionsForCategory("-1"),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          //onChanged: (value) => _runFilter(value),
                          controller: _controller,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => _runFilter(_controller.text),
                                icon: Icon(Icons.search),
                              ),
                              prefixIcon: IconButton(
                                  onPressed: this.clear,
                                  icon: Icon(Icons.clear)),
                              labelText: 'Search for an emotion',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              filled: true,
                              fillColor: Colors.white70),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: _allUsers.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _foundUsers.length,
                                  itemBuilder: (context, index) => Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    key: ValueKey(_foundUsers[index]["id"]),
                                    color: Color.fromARGB(255, 249, 187, 178),
                                    elevation: 10,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 10),
                                    child: ListTile(
                                      title: Padding(
                                          padding: EdgeInsets.only(
                                              left: 12, top: 8, right: 12),
                                          child: Text(
                                              _foundUsers[index]['name'],
                                              style: const TextStyle(
                                                  fontSize: 24))),
                                      subtitle: Padding(
                                          padding: EdgeInsets.only(
                                              left: 9,
                                              top: 8,
                                              right: 9,
                                              bottom: 25),
                                          child: Text(
                                              _foundUsers[index]['description'],
                                              style: const TextStyle(
                                                  fontSize: 18))),
                                    ),
                                  ),
                                )
                              : const Text(
                                  'No results found',
                                  style: TextStyle(fontSize: 24),
                                ),
                        ),
                      ],
                    ),
            );
          }),
    );
  }
}
