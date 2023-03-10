import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isahomework/component/my_button.dart';

class WinPage extends StatelessWidget {
  const WinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('intelligent search algorithem project')),
        body: Center(
            child: MyButton(
          myFunction: () {
            Get.offNamed('/', arguments: Get.arguments);
          },
          myText: 'You win... play agian',
          myColor: Colors.grey,
          textColor: Colors.black,
          myRadius: 15,
        )));
  }
}
