// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  Color? cardColor;
  late double top;
  late double left;
  MyCard({
    Key? key,
    this.cardColor,
    required this.top,
    required this.left,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top * 30,
      left: left * 30,
      // child: GestureDetector(
      //   onTap: () {
      //     controller.fortc.value = left;
      //     controller.fortr.value = top;
      //     // controller.move(top * 30, left * 30);

      //   },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          color: cardColor,
        ),
      ),
    );
    // );
  }
}
