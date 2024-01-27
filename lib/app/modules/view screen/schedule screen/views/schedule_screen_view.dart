import 'package:amin_agent/app/modules/view%20screen/map%20screen/views/map_screen_navigate.dart';
import 'package:intl/intl.dart';

import '../../../../data/const/export.dart';
import '../components/schedule_card.dart';

class ScheduleScreenView extends StatelessWidget {
  ScheduleScreenView({Key? key}) : super(key: key);
  final controller = Get.put(ScheduleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: buildSecondaryAppbar('Schedule'),
      body: GetBuilder<ScheduleScreenController>(builder: (controller) {
        return controller.isProgress
            ? const ShimmerTargetList()
            : ListView.builder(
                itemCount: controller.allScheduleList.length,
                itemBuilder: (context, index) {
                  DateTime startTime = DateFormat("HH:mm:ss").parse(
                      controller.allScheduleList[index]['meeting_start_date']);
                  DateTime endTime = DateFormat("HH:mm:ss").parse(
                      controller.allScheduleList[index]['meeting_end_time']);
                  // Format the times in the desired format
                  String formattedStartTime =
                      DateFormat("h:mma").format(startTime);
                  String formattedEndTime = DateFormat("h:mma").format(endTime);

                  return ScheduleCard(
                    sendTap: () {
                      Get.to(
                        () => MapScreenNavigate(
                          lat: controller.allScheduleList[index]['chamber_lat'],
                          long: controller.allScheduleList[index]
                              ['chamber_long'],
                          isLatLng: true,
                        ),
                      );
                    },
                    doneTap: () {
                      finisScheduleDialog(context,
                          img: AppImages.doneIcon,
                          title: 'Are you sure?',
                          body: 'This visit is done!', yesTap: () {
                        Get.back();
                        takePhotoDialog(context,
                            img: AppImages.cameraSvg,
                            title: 'Like to take a picture?',
                            yesTap: completedLocationTaskDialog);
                      });
                    },
                    image: controller.allScheduleList[index]['doctor_avatar'],
                    subtitle: '$formattedStartTime - $formattedEndTime',
                    title: controller.allScheduleList[index]['doctor_name'],
                  );
                },
              );
      }),
    );
  }
}
