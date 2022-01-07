import 'package:flutter/material.dart';

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
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Fericire",
      "description":
          "Fericirea este o stare mentală de bine, fiind caracterizată de emoţii pozitive sau plăcute, de la mulţumire la bucurie intensă.",
    },
    {
      "id": 2,
      "name": "Ușurare",
      "description": "Te simți eliberat de sub apăsarea unui lucru greu.",
    },
    {
      "id": 3,
      "name": "Mulțumire",
      "description":
          "Sfaturi: Cultiva-ti vorbirea intr-o voce calda, joasa. Nu lasa niciodata sa treaca o ocazie fara sa incurajezi pe cineva sau sa spui ceva frumos cuiva.",
    },
    {
      "id": 4,
      "name": "Binecuvântare",
      "description":
          "Fă o listă de lucruri și oameni pentru care ești recunoscător în viața ta.",
    },
    {
      "id": 5,
      "name": "Încântare",
      "description": "Ce ai auzit/văzut/simțit/experimentat astăzi frumos?",
    },
    {
      "id": 6,
      "name": "Amuzare",
      "description": "Ai auzit o glumă bună?",
    },
    {
      "id": 7,
      "name": "Mândrie",
      "description": "Ce ai realizat astăzi minunat?",
    },
    {
      "id": 8,
      "name": "Răsplătire",
      "description":
          "Ai muncit din greu pentru ceva anume și ai fost remunerat pe măsură.",
    },
    {
      "id": 9,
      "name": "Satisfăcere",
      "description":
          "Ai muncit din greu pentru ceva anume și ți-a ieșit cum ți-ai propus.",
    },
    {
      "id": 10,
      "name": "Optimism",
      "description":
          "Orice s-ar întâmpla acum, vezi partea pozitivă a lucrurilor.",
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
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

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 237, 227),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search for an emotion',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    filled: true,
                    fillColor: Colors.white70)),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Color.fromARGB(255, 249, 187, 178),
                        elevation: 10,
                        margin: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 10),
                        child: ListTile(
                          title: Padding(
                              padding:
                                  EdgeInsets.only(left: 12, top: 8, right: 12),
                              child: Text(_foundUsers[index]['name'],
                                  style: const TextStyle(fontSize: 24))),
                          subtitle: Padding(
                              padding: EdgeInsets.only(
                                  left: 9, top: 8, right: 9, bottom: 25),
                              child: Text(_foundUsers[index]['description'],
                                  style: const TextStyle(fontSize: 18))),
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
      ),
    );
  }
}
