// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isahomework/play_controller.dart';

class PointForMove extends StatelessWidget {
  PlayController controller = Get.find();
  double top;
  double left;
  int i = 0;
  PointForMove({
    Key? key,
    required this.top,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top * 30 + 5,
      left: left * 30 + 5,
      child: GestureDetector(
        onTap: () {
          controller.s.fortc.value = left;
          controller.s.fortr.value = top;
          controller.s.move(top * 30, left * 30);
        },
        child: const Icon(
          Icons.circle,
          color: Colors.black38,
          size: 20,
        ),
      ),
    );
  }
}
