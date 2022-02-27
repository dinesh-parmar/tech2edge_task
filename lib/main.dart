import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech2edge/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      title: 'Tech2Edge Series Task',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}
