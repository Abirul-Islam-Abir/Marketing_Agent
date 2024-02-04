import 'package:amin_agent/app/modules/view%20screen/map%20screen/views/map_screen_navigate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../data/const/export.dart';
import '../../map screen/views/poly_map_screen.dart';
import '../components/schedule_card.dart';

class ScheduleScreenView extends StatelessWidget {
  ScheduleScreenView({Key? key}) : super(key: key);
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
        backgroundColor: AppColor.kWhiteColor,
        appBar: buildSecondaryAppbar('Schedule'),
        body: GetBuilder<ScheduleScreenController>(builder: (controller) {
          return controller.isProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.allScheduleList.isEmpty
                  ? const Center(child: Text('There is no schedules'))
                  : RefreshIndicator(
                      onRefresh: () async {
                        _dashboardController.dashboardData();
                      },
                      child: SizedBox(
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
                            final date =
                                '$formattedStartTime - $formattedEndTime';
                            return ScheduleCard(
                              sendTap: () {
                                Get.to(() => MapScreen(
                                    time: date,
                                    id: id,
                                    lat: double.parse(lat),
                                    avatar: avatar,
                                    lang: double.parse(lang),
                                    name: name));
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
                                          imageSource: ImageSource.camera,
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
                      ),
                    );
        }),
      ),
    );
  }
}