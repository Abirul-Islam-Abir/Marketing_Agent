import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/components/completed_schedule_card.dart';
import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/controller/completed_schedule_controller.dart';
import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';

import '../../../../data/const/export.dart';
import '../../../../data/utils/method.dart';
import '../../../widgets/shimmer_schedule_card_list.dart';
 import '../../map screen/views/poly_map_screen.dart';

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
                        final date = data[index]['meeting_start_date'];
                        final avatar = data[index]['doctor_avatar'];
                        final lat = data[index]['chamber_lat'];
                        final lang = data[index]['chamber_long'];
                        final id = data[index]['uid'];
                         return CompletedScheduleCard(
                            sendTap: () {
                              Get.to(() => MapScreen(
                                  time: date,
                                  id: id,
                                 // lat: 23.89174427074331,
                                  lat: double.parse(lat),
                                  lang: double.parse(lang),
                                  avatar: avatar,
                               //   lang: 90.39004507490078,
                                  name: name));
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