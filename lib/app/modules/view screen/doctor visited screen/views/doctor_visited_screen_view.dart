import 'package:amin_agent/app/data/utils/method.dart';
import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';

import '../../../../data/const/export.dart';

class DoctorVisitedScreenView extends StatelessWidget {
  DoctorVisitedScreenView({super.key});
  final controller = Get.put(DoctorOnboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildFilterAppBars(
          text: 'Doctor Visited',
          filterTap: () {
            Get.dialog(FilterScreenView(
              onTap: () {
                Get.back();
                controller.initializeMethod(selectedRangeDate);
              },
            ));
          }),
      body: GetBuilder<DoctorOnboardScreenController>(builder: (controller) {
        final data = controller.doctorVisitedList;
        return controller.isProgress
            ? const ShimmerTargetList()
            : data.isEmpty
                ? const EmptyListText()
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.initializeMethod(joinedDates);
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final name = data[index]['doctor_name'];
                          final date = data[index]['completed_date'];
                          return DoctorOnboardCard(
                            location: name,
                            date: date,
                          );
                        },
                      ),
                    ),
                  );
      }),
    );
  }
}