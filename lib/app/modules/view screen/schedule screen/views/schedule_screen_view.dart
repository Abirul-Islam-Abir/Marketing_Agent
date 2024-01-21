import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';
import '../components/schedule_card.dart';

class ScheduleScreenView extends GetView<ScheduleScreenController> {
  const ScheduleScreenView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: buildSecondaryAppbar('Schedule'),
      body: ListView.builder(
        itemCount: scheduleList.length,
        itemBuilder: (context, index) => ScheduleCard(
          sendTap: () {
            Get.toNamed(RouteName.mapScreen);
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
          image: scheduleList[index].imageUrl,
          subtitle: scheduleList[index].subtitle,
          title: scheduleList[index].title,
        ),
      ),
    );
  }
}
