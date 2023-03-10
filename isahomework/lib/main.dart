import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isahomework/first_page.dart';
import 'package:isahomework/Ui.dart';
import 'package:isahomework/ui_binding.dart';
import 'win_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'intelligent searcj algorithem project',
      initialRoute: '/FirstPage',
      getPages: [
        GetPage(name: '/', page: () => Ui(), binding: UiBinding()),
        GetPage(name: '/FirstPage', page: () => const FirstPage()),
        GetPage(name: '/WinPag', page: () => const WinPage()),
      ],
    );
  }
}
