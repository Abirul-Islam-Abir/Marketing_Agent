

import 'package:amin_agent/app/modules/view%20screen/schedule%20screen/components/schedule_card.dart';

import '../../../../data/const/export.dart';

class ScheduleScreenView extends GetView<ScheduleScreenController> {
  ScheduleScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ScheduleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: secondaryAppbar('Schedule'),
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
                primaryDialog(context,
                    img: AppImages.doneIcon,
                    title: 'Are you sure?',
                    body: 'This visit is done!',
                    yesTap: completedLocationTaskDialog);
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
