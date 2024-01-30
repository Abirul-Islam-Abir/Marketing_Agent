
import '../../../../data/const/export.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  const NotificationScreenView({Key? key}) : super(key: key);
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kScaffoldWhite,
        appBar: buildNavigateAppbar(AppString.notification),
        body: SizedBox( height: double.infinity,
          child: ListView.builder(
            itemCount: notificationList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => NotificationCard(
              time: notificationList[index].time,
              day: notificationList[index].day,
              data: notificationList[index].data,
            ),
          ),
        ));
  }
}