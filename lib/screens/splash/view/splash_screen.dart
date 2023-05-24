import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 5),() {
      Get.toNamed('/navigation');
    },);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff033E5E),
        body: Center(
          child: Image.asset("assets/images/img.png"),
        ),
      ),
    );
  }
}
