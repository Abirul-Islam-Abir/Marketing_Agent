
import 'package:intl/intl.dart';

import '../../../../data/const/export.dart';

class ScheduleScreenView extends StatelessWidget {
  ScheduleScreenView({super.key});

  final controller = Get.put(ScheduleScreenController());
  final _dashboardController = Get.put(DashboardScreenController());
  final _bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _bottomNavController.selectIndex(0);
      },
      child: Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildFilterAppBar(
            text: 'Schedule',
            filterTap: () {
              Get.dialog(FilterScreenView(
                onTap: () {
                  Get.back();
                  controller.initializeMethod(joinedSelectedDates);
                },
              ));
            }),
        body: RefreshIndicator(
          onRefresh: () async {
            _dashboardController.dashboardData();
            controller.initializeMethod(joinedDates);
          },
          child: GetBuilder<ScheduleScreenController>(builder: (controller) {
            return controller.isProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: controller.allScheduleList.length,
                      itemBuilder: (context, index) {
                        final data = controller.allScheduleList;
                        DateTime startTime = DateFormat("HH:mm:ss")
                            .parse(data[index]['meeting_start_date']);
                        DateTime endTime = DateFormat("HH:mm:ss")
                            .parse(data[index]['meeting_end_time']);
                        // Format the times in the desired format
                        String formattedStartTime =
                            DateFormat("h:mma").format(startTime);
                        String formattedEndTime =
                            DateFormat("h:mma").format(endTime);
                        final avatar = data[index]['doctor_avatar'];
                        final name = data[index]['doctor_name'];
                        final lat = data[index]['chamber_lat'];
                        final lang = data[index]['chamber_long'];
                        final id = data[index]['uid'];
                        final date = '$formattedStartTime - $formattedEndTime';
                        return ScheduleCard(
                          sendTap: () {
                            Get.toNamed(RouteName.defaultMapScreen, arguments: {
                              'lat': 23.89664433606447 ,
                              'lang':  90.35888393304744,
                              'name': name,
                              'avatar': avatar,
                              'id': id,
                              'time': date
                            });
                          },
                          image: avatar,
                          subtitle: date,
                          title: name,
                          doneTap: () {
                            finisScheduleDialog(context,
                                img: AppImages.doneIcon,
                                title: 'Are you sure?',
                                body: 'This visit is done!', yesTap: () {
                              Get.back();
                              addCameraPhotoDialog(
                                cameraTap: () {
                                  controller.getImage(
                                      imageSource: ImageSource.gallery,
                                      completionLat: lat,
                                      completionLang: lang,
                                      uid: id,
                                      index: index);
                                },
                              );
                            });
                          },
                        );
                      },
                    ),
                  );
          }),
        ),
      ),
    );
  }
}