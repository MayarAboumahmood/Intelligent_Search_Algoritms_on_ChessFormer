import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isahomework/component/my_textfield.dart';
import 'component/my_button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intelligent Search Algorithm',
              style: TextStyle(fontSize: Get.width * .03)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .3),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  MyButton(
                    myFunction: () {
                      Get.toNamed('/', arguments: 'user play');
                    },
                    myText: 'User play',
                    myColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: Get.height * .05),
                  MyButton(
                    myFunction: () {
                      Get.toNamed('/', arguments: 'DFS');
                    },
                    myText: 'DFS',
                    myColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: Get.height * .05),
                  MyButton(
                    myFunction: () {
                      Get.toNamed('/', arguments: 'BFS');
                    },
                    myText: 'BFS',
                    myColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: Get.height * .05),
                  MyButton(
                    myFunction: () {
                      Get.toNamed('/', arguments: 'Dijkstra');
                    },
                    myText: 'Dijkstra',
                    myColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: Get.height * .05),
                  MyButton(
                    myFunction: () {
                      Get.toNamed('/', arguments: 'A Star');
                    },
                    myText: 'A star',
                    myColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: Get.height * .1),
                  // MyTextfield(
                  //     onDone: null,
                  //     labelTextColor: Colors.blue,
                  //     padingOnWidth: 2,
                  //     hintTextColor: Colors.blue,
                  //     myhintText: '',
                  //     myIcon: null,
                  //     myLabelText: 'the board width'),
                  // SizedBox(height: Get.height * .05),
                  // MyTextfield(
                  //     labelTextColor: Colors.blue,
                  //     onDone: null,
                  //     padingOnWidth: 2,
                  //     hintTextColor: Colors.blue,
                  //     myhintText: '',
                  //     myIcon: null,
                  //     myLabelText: 'the board height'),
                ],
              ),
            ),
          ),
        ));
  }
}
