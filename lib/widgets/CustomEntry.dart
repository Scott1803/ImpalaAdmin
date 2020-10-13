import 'package:flutter/material.dart';

class CustomEntry extends StatefulWidget {
  final String hint;
  final double width;
  CustomEntry({Key key, this.hint, this.width}) : super(key: key);

  @override
  _CustomEntryState createState() =>
      _CustomEntryState(hint: hint, width: width);
}

class _CustomEntryState extends State<CustomEntry> {
  final String hint;
  final double width;
  _CustomEntryState({this.hint, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: width,
      decoration: new BoxDecoration(
        color: Colors.grey[400],
        borderRadius: new BorderRadius.circular(15.0),
      ),
      child: new TextField(
        decoration: new InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
