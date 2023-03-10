// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  String myText;
  int myRadius;
  Color myColor;
  Color textColor;
  Function()? myFunction;
  MyButton({
    Key? key,
    required this.myText,
    required this.textColor,
    this.myColor = Colors.red,
    this.myRadius = 5,
    required this.myFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * .08,
        width: Get.width * .4,
        decoration: BoxDecoration(
            color: myColor,
            borderRadius: BorderRadius.circular(
              Get.width * myRadius * 0.003,
            )),
        child: TextButton(
          onPressed: myFunction,
          child: Text(myText, style: TextStyle(color: textColor)),
        ));
  }
}
