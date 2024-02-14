
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
            final data = controller.allScheduleList;
            return controller.isProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : data.isEmpty
                    ? const EmptyListText()
                    : SizedBox(
                        height: double.infinity,
                        child: ListView.builder(
                          itemCount: controller.allScheduleList.length,
                          itemBuilder: (context, index) {
                            final startTime = data[index]['meeting_start_time']??'';
                            final endTime = data[index]['meeting_end_time']??'';
                            final avatar = data[index]['doctor_avatar'];
                            final name = data[index]['doctor_name'];
                            final lat = data[index]['chamber_lat'];
                            final lang = data[index]['chamber_long'];
                            final id = data[index]['uid'];
                            final date =
                                '$startTime - $endTime';
                            var lt = 23.901178327001023;
                            var ln = 90.35821189567085;
                            double roundedLat =
                            double.parse(lt.toStringAsFixed(2));
                            double roundedLng =
                            double.parse(ln.toStringAsFixed(2));
                            double userLat = 23.900741394283624;
                            double userLang = 90.35748546437945;
                            double currentLat =
                            double.parse(userLat.toStringAsFixed(3));
                            double currentLan =
                            double.parse(userLang.toStringAsFixed(3));
                            return ScheduleCard(
                              sendTap: () {
                                Get.toNamed(RouteName.defaultMapScreen,
                                    arguments: {
                                      'lat': lt,
                                      'lang': ln,
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
                      );
          }),
        ),
      ),
    );
  }
}