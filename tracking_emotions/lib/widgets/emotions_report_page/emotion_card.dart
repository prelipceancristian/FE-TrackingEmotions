// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EmotionCard extends StatelessWidget {
  final String heading;
  final String subheading;
  final String supportingText;
  const EmotionCard(
      {Key key, this.heading, this.subheading, this.supportingText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        color: Color.fromARGB(255, 249, 187, 178),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(heading ?? 'default heading',
                  style: const TextStyle(fontSize: 30)),
              leading: const Icon(
                Icons.circle_rounded,
                color: Colors.purple,
                size: 50.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(supportingText ?? 'default subheading',
                  style: const TextStyle(fontSize: 20)),
            ),
            Container(
              padding: const EdgeInsets.all(13.0),
              alignment: Alignment.center,
              child: Text(
                subheading ?? 'default subheading',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
