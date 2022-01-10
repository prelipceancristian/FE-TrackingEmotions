import 'package:flutter/material.dart';

class SubmitEmotionRecordPageText extends StatelessWidget {
  final String text;

  SubmitEmotionRecordPageText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
