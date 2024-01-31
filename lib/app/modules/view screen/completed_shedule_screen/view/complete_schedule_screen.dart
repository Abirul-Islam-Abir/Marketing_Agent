import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/controller/completed_schedule_controller.dart';
import 'package:amin_agent/app/modules/view%20screen/schedule%20screen/components/schedule_card.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/shimmer_schedule_card_list.dart';
import '../../all tests screen/controller/all_test_screen_controller.dart';

class CompletedScheduleScreen extends StatelessWidget {
  CompletedScheduleScreen({super.key});

  final controller = Get.put(CompleteScheduleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildFilterAppBars(
          filterTap: () {
            Get.dialog(FilterScreenView());
          },
          text: 'Completed Schedule'),
      body: GetBuilder<CompleteScheduleScreenController>(builder: (controller) {
        final data = controller.completedScheduleList;
        return controller.isProgress
            ? const SimmerScheduleCardList()
            : controller.completedScheduleList.isEmpty
                ? const Center(child: Text('There is no schedules'))
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.initializeMethod();
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => ScheduleCard(
                            title: data[index]['doctor_name'],
                            subtitle: data[index]['meeting_start_date'],
                            image: data[index]['doctor_avatar']),
                      ),
                    ),
                  );
      }),
    );
  }
}