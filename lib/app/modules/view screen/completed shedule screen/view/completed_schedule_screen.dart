
import '../../../../data/const/export.dart';

class CompletedScheduleScreen extends StatelessWidget {
  CompletedScheduleScreen({super.key});

  final controller = Get.put(CompleteScheduleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateFilterAppBar(
          text: 'Completed Schedules',
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
          controller.initializeMethod(joinedDates);
        },
        child: GetBuilder<CompleteScheduleScreenController>(builder: (controller) {
          final data = controller.completedScheduleList;
          return controller.isProgress
              ? const SimmerScheduleCardList()
              : controller.completedScheduleList.isEmpty
                  ? const EmptyListText()
                  : SizedBox(
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {

                        final name = data[index]['doctor_name'];
                        final startTime = data[index]['meeting_start_time']??'';
                        final endTime = data[index]['meeting_end_time']??'';
                        final avatar = data[index]['doctor_avatar'];
                        final lat = data[index]['chamber_lat'];
                        final lang = data[index]['chamber_long'];
                        final id = data[index]['uid'];
                        final date =
                            '$startTime - $endTime';
                         return CompletedScheduleCard(
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
                            title: name,
                            subtitle: date,
                            image: avatar);
                      },
                    ),
                  );
        }),
      ),
    );
  }
}