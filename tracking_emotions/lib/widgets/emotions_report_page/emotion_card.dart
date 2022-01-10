// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
