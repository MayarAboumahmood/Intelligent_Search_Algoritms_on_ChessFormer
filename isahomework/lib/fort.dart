// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Fort extends StatelessWidget {
  double left;
  double top;
  var fortColor;
  Fort({
    Key? key,
    this.fortColor = const Color.fromARGB(255, 5, 70, 7),
    required this.left,
    required this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top * 30,
      left: left * 30,
      child: Icon(Icons.fort, size: 30, color: fortColor),
    );
  }
}
