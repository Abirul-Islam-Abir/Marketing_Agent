import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/components/completed_schedule_card.dart';
import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/controller/completed_schedule_controller.dart';
import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/shimmer_schedule_card_list.dart';
import '../../map screen/views/map_screen_navigate.dart';

class CompletedScheduleScreen extends StatelessWidget {
  CompletedScheduleScreen({super.key});

  final controller = Get.put(CompleteScheduleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar('Completed Schedule'),
      body: GetBuilder<CompleteScheduleScreenController>(builder: (controller) {
        final data = controller.completedScheduleList;
        return controller.isProgress
            ? const SimmerScheduleCardList()
            : controller.completedScheduleList.isEmpty
                ? const EmptyListText()
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.initializeMethod();
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final name = data[index]['doctor_name'];
                          final startDate = data[index]['meeting_start_date'];
                          final avatar = data[index]['doctor_avatar'];

                          final lat = data[index]['chamber_lat'];
                          final lang = data[index]['chamber_long'];
                          final id = data[index]['uid'];
                          return CompletedScheduleCard(
                              sendTap: () {
                                Get.to(() => MapScreenNavigate(
                                    lat: lat, long: lang, uid: id));
                              },
                              title: name,
                              subtitle: startDate,
                              image: avatar);
                        },
                      ),
                    ),
                  );
      }),
    );
  }
}