// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EmotionCard extends StatefulWidget {
  // const EmotionCard(
  //     {Key key, this.heading, this.subheading, this.supportingText, this.time})
  //     : super(key: key);

  EmotionCard({this.heading, this.subheading, this.supportingText, this.time});

  String heading;
  String subheading;
  String supportingText;
  String time;

  @override
  State<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends State<EmotionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Color.fromARGB(255, 249, 187, 178),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Color.fromARGB(255, 249, 187, 178),
          width: 1.5,
        ),
      ),
      child: Stack(children: [
        // Image.asset(
        // 'assets/icons/cardPatrick.jpg',
        // ),
        Column(
          children: [
            ListTile(
              title: Text(
                widget.heading ?? 'default heading',
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red[200],
                child: Text(
                  widget.heading[0],
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
                radius: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                widget.time ?? 'default time',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(widget.supportingText ?? 'default subheading',
                  style: const TextStyle(fontSize: 25)),
            ),
            Container(
              padding: const EdgeInsets.all(13.0),
              alignment: Alignment.center,
              child: Text(
                widget.subheading ?? 'default subheading',
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
