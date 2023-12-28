import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/dummy data/schedule_dummy_data.dart';
import '../../../../data/utils/app_string.dart';
import '../../../../data/utils/utils.dart';
import '../../../../routes/app_pages.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/primary_appbar.dart';
import '../components/schedule_card.dart';
import '../controllers/shedule_screen_controller.dart';

class ScheduleScreenView extends GetView<SheduleScreenController> {
  ScheduleScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(SheduleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar:  secondaryAppbar('Schedule', (){}),
      body: Center(
        child: SizedBox(
          width: Get.width / 0.6,
          child: ListView.builder(
            itemCount: scheduleList.length,
            itemBuilder: (context, index) => ScheduleCard(
              sendTap: () {
                Get.toNamed(RouteName.mapScreen);
              },
              doneTap: () {
                primaryDialog(context);
              },
              image: scheduleList[index].imageUrl,
              subtitle: scheduleList[index].subtitle,
              title: scheduleList[index].title,
            ),
          ),
        ),
      ),
    );
  }
}
