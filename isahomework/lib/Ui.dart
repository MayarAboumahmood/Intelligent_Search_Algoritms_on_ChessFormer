import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isahomework/play_controller.dart';
import 'fort.dart';

class Ui extends StatelessWidget {
  PlayController controller = Get.find();
  double kingc = 5;
  double kingr = 9;
  double boardr = 10;
  double boardc = 10;

  Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Get.arguments)),
        body: Padding(
            padding:
                EdgeInsets.only(left: Get.width * .1, top: Get.height * .1),
            child: GetX<PlayController>(
                init: PlayController(),
                builder: (value) => (Stack(
                      children: [
                        Stack(
                          children:
                              controller.s.board(controller.boardr, boardc),
                        ),
                        controller.s.move(
                            controller.s.fortc.value, controller.s.fortr.value),
                        Fort(
                            left: kingc,
                            top: kingr,
                            fortColor: Colors.brown[600]),
                        Stack(
                          children: controller.s.checkMovesLiat(
                              controller.s.fortc.value,
                              controller.s.fortr.value,
                              boardc.toDouble(),
                              boardr.toDouble()),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: Get.height * .4, left: Get.width * .4),
                            child: Get.arguments != 'user play'
                                ? Text('${controller.counter}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: Get.width * .1))
                                : const Text('')),
                        controller.s.isFinal(
                                kingc,
                                kingr,
                                controller.s.fortc.value,
                                controller.s.fortr.value)
                            ? Padding(
                                padding: EdgeInsets.only(top: Get.height * .4),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.offNamed('/WinPag',
                                        arguments: Get.arguments);
                                    Get.delete<PlayController>();
                                  },
                                  child: const AlertDialog(
                                    backgroundColor: Colors.green,
                                    actions: [
                                      Center(child: Text('tap here!! '))
                                    ],
                                  ),
                                ),
                              )
                            : const Text(''),
                      ],
                    )))));
  }
}
