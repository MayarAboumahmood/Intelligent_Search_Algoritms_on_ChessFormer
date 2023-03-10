// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextfield extends StatelessWidget {
  void Function(String)? onDone;
  double padingOnWidth;
  Color? hintTextColor;
  Color? labelTextColor;
  Color? iconColor;
  Color focusedBorderColor;
  Color enabledBorderColor;
  String? myLabelText;
  String myhintText;
  IconData? myIcon;
  MyTextfield({
    Key? key,
    required this.padingOnWidth,
    required this.onDone,
    this.focusedBorderColor = Colors.red,
    this.labelTextColor,
    this.iconColor,
    this.enabledBorderColor = Colors.red,
    required this.hintTextColor,
    required this.myhintText,
    required this.myIcon,
    required this.myLabelText,
  }) : super(key: key);
// the text color is not ready yet and the icons color
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Get.width * padingOnWidth * 0.1),
      child: TextField(
        onSubmitted: onDone,
        style: const TextStyle(color: Colors.red),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 3, color: focusedBorderColor)),
            hintText: myhintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 3, color: enabledBorderColor)),
            hintStyle: TextStyle(color: hintTextColor),
            prefixIcon: Icon(
              myIcon,
              color: iconColor,
            ),
            border: const OutlineInputBorder(),
            labelText: myLabelText,
            labelStyle: TextStyle(color: labelTextColor)),
      ),
    );
  }
}
