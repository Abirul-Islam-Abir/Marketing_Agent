import '../../../../data/const/export.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  NotificationScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppbar(AppString.notification),
      backgroundColor: AppColor.kScaffold,
      body: Center(
        child: SizedBox(
          width: Get.width / 0.6,
          child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (context, index) => NotificationCard(
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
