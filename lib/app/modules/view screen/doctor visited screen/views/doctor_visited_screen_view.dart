
import '../../../../data/const/export.dart';

class DoctorVisitedScreenView extends StatelessWidget {
  DoctorVisitedScreenView({super.key});
  final controller = Get.put(DoctorOnboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateFilterAppBar(
          text: 'Doctor Visited',
          filterTap: () {
            Get.dialog(FilterScreenView(
              onTap: () {
                Get.back();
                controller.initializeMethod(joinedSelectedDates);
              },
            ));
          }),
      body:  RefreshIndicator(
        onRefresh: () async {
          controller.initializeMethod(joinedDates);
        },
        child: GetBuilder<DoctorOnboardScreenController>(builder: (controller) {
          final data = controller.doctorVisitedList;
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
                        return DoctorOnboardCard(
                          location: name,
                          date: date,
                        );
                      },
                    ),
                  );
        }),
      ),
    );
  }
}