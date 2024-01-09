import 'package:amin_agent/app/data/const/export.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
    SplashScreenView({Key? key}) : super(key: key);
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    controller.checkIfLogged;
    return const Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Center(
        child: Text(
          'SplashScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
