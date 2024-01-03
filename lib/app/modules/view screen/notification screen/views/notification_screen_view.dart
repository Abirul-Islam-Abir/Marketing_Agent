import 'package:amin_agent/app/data/utils/app_string.dart';
 import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/dummy data/notification_dummy_data.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/primary_appbar.dart';
import '../components/notification_card.dart';
import '../controllers/notification_screen_controller.dart';
import 'notification_details.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  NotificationScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppbar(AppString.notification ),
      backgroundColor: AppColor.kScaffold,
      body: Center(
        child: SizedBox(
          width: Get.width/0.6,
          child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (context, index) =>
                NotificationCard(
                  seeMoreTap: () {
                    Get.to(()=>NotificationDetailsScreen(
                      name: 'Hi, John!',
                        data: notificationList[index].data,
                        day: notificationList[index].day,
                        time: notificationList[index].time));
                  },
                  data: notificationList[index].data,
                  day: notificationList[index].day,
                  time: notificationList[index].time,
                ),
          ),
        ),
      ),
    );
  }
}
