import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/data/utils/method.dart';
import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/components/completed_schedule_card.dart';
import 'package:amin_agent/app/modules/view%20screen/target%20wise%20doctor%20visited/controller/target_wise_doctor_visited_controller.dart';

import '../../../widgets/empty_list_text.dart';
import '../../map screen/views/poly_map_screen.dart';

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
                          final name = data[index]['doctor_name'];
                          final date = data[index]['completed_date'];
                          final avatar = data[index]['doctor_avatar'];
                          final lat = data[index]['chamber_lat'];
                          final lang = data[index]['chamber_long'];
                          final id = controller.id;
                          return CompletedScheduleCard(
                            image: avatar,
                            subtitle: date,
                            title: name,
                            sendTap: () {
                              Get.to(() => MapScreen(
                                  id: id,
                                  time: date,
                                  name: name,
                                  lang: lang,
                                  lat: lat,
                                  avatar: avatar));
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