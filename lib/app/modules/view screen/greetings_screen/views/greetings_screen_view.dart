import 'package:amin_agent/app/data/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/utils/app_string.dart';

import '../../../../routes/app_pages.dart';
import '../../../../theme/app_color.dart';
import '../components/animate_congratulate.dart';
import '../components/completed_target_text.dart';
import '../components/continue_button.dart';
import '../controllers/greetings_screen_controller.dart';

class GreetingsScreenView extends GetView<GreetingsScreenController> {
  GreetingsScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(GreetingsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(AppImages.trophy),
                  Image.asset(AppImages.bottomTrophy),
                  CompletedTargetText(AppString.completedTarget),
                  SizedBox(height: 10.h),
                  ContinueButton(
                      text: AppString.complete,
                      onTap: () {
                        Get.offAllNamed(RouteName.bottomNav);
                      })
                ],
              ),
            ),
          ),
            const AnimateCongratulate()
        ],
      ),
    );
  }
}
