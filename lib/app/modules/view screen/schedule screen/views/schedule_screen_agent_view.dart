import 'package:amin_agent/app/modules/view%20screen/map%20screen/views/map_screen_navigate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/shimmer_schedule_card_list.dart';
import '../components/schedule_card.dart';

class ScheduleScreenAgentView extends StatelessWidget {
  ScheduleScreenAgentView({Key? key}) : super(key: key);
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
        appBar: buildNavigateAppbar('Schedule'),
        body: GetBuilder<ScheduleScreenController>(builder: (controller) {
          return controller.isProgress
              ? const SimmerScheduleCardList()
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

                            return ScheduleCard(
                              sendTap: () {
                                Get.to(
                                  () => MapScreenNavigate(
                                    lat: data[index]['chamber_lat'],
                                    long: data[index]['chamber_long'],

                                  ),
                                );
                              },
                              image: data[index]['doctor_avatar'],
                              subtitle:
                                  '$formattedStartTime - $formattedEndTime',
                              title: data[index]['doctor_name'],
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
                                          completionLat: data[index]
                                              ['chamber_lat'],
                                          completionLang: data[index]
                                              ['chamber_long'],
                                          uid: data[index]['uid'],
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