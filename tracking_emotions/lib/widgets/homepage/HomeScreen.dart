import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracking_emotions/widgets/dialogs/pop-up-question.dart';
import 'package:tracking_emotions/widgets/user-details/user-details-page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset('assets/icons/coffee.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                    child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top:
                            280), //𝘏𝘰𝘸 𝘢𝘳𝘦 𝘺𝘰𝘶 𝘧𝘦𝘦𝘭𝘪𝘯𝘨 𝘵𝘰𝘥𝘢𝘺?
                    child: Card(
                        color:
                            Color.fromARGB(255, 249, 187, 178).withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ListTile(
                            title: Text(
                                '𝘏𝘰𝘸 𝘢𝘳𝘦 𝘺𝘰𝘶 𝘧𝘦𝘦𝘭𝘪𝘯𝘨 𝘵𝘰𝘥𝘢𝘺?',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white.withOpacity(0.7)),
                                textAlign: TextAlign.center))),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 30, right: 25, left: 25, bottom: 25),
                    child: TextButton(
                        child: Text(
                          "Let's start",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          TextStyle(backgroundColor: Colors.red);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PopUpQuestion()));
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(
                                  bottom: 16, top: 16, left: 32, right: 32),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 249, 187, 178)
                                    .withOpacity(0.7)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.red.shade200.withOpacity(0.1),
                                  width: 3,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ))),
                  )
                ])),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetailsPage()))
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30.0, right: 20.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(238, 161, 119, 1.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icons/user_page.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
