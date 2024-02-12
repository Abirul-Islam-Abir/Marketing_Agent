import '../../../../data/const/export.dart';

class TargetWiseDoctorVisitedScreen extends StatelessWidget {
  TargetWiseDoctorVisitedScreen({super.key});

  final _controller = Get.put(TargetWiseDoctorVisitedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateFilterAppBar(
          text: 'Doctor Visited',
          filterTap: () {
            Get.back();
            _controller.initializeMethod(joinedSelectedDates);
          }),
      body: RefreshIndicator(
        onRefresh: () async {
          _controller.initializeMethod(joinedDates);
        },
        child: GetBuilder<TargetWiseDoctorVisitedController>(
            builder: (controller) {
          final data = controller.targetWiseDoctorVisitedList;
          return controller.isProgress
              ? const ShimmerTargetList()
              : data.isEmpty
                  ? const EmptyListText()
                  : SizedBox(
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final name = data[index]['doctor_name'] ?? '';
                          final date = data[index]['completed_date'] ?? '';
                          final avatar = data[index]['doctor_avatar'] ?? '';
                          final lat = data[index]['chamber_lat'] ?? '';
                          final lang = data[index]['chamber_long'] ?? '';
                          final id = controller.id;
                          return CompletedScheduleCard(
                            image: avatar,
                            subtitle: date,
                            title: name,
                            sendTap: () {
                              Get.toNamed(RouteName.defaultMapScreen,
                                  arguments: {
                                    'lat': 23.89664433606447,
                                    'lang': 90.35888393304744,
                                    'name': name,
                                    'avatar': avatar,
                                    'id': id,
                                    'time': date
                                  });
                            },
                          );
                        },
                      ),
                    );
        }),
      ),
    );
  }
}