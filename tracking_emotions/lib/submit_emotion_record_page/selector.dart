import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  List<String> values;
  String prefixIconType;
  Function(String) callBack;

  Selector(
      List<String> values, String prefixIconType, Function(String) callBack) {
    this.values = values;
    this.prefixIconType = prefixIconType;
    this.callBack = callBack;
  }

  @override
  _SelectorState createState() => _SelectorState(values, prefixIconType);
}

class _SelectorState extends State<Selector> {
  String dropdownValue;
  List<String> values;
  String prefixIconType;

  _SelectorState(List<String> values, String prefixIconType) {
    this.values = values;
    this.prefixIconType = prefixIconType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 40,
          ),
          iconSize: 24,
          elevation: 16,
          hint: Text('Select'),
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 28,
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0),
              ),
            ),
          ),
          onChanged: (String newValue) {
            setState(() {
              widget.callBack(newValue);
              dropdownValue = newValue;
            });
          },
          items: values.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(0),
      alignment: AlignmentDirectional.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        color: Colors.white,
      ),
    );
  }

  Widget prefixIcon() {
    if (prefixIconType == 'emotion')
      return Icon(
        Icons.emoji_emotions,
        size: 40,
      );
    else if (prefixIconType == 'location')
      return Icon(
        Icons.location_city,
        size: 40,
      );
    else if (prefixIconType == 'person')
      return Icon(
        Icons.people,
        size: 40,
      );
    else
      return null;
  }

  String getDropdownValue() {
    return dropdownValue;
  }
}
