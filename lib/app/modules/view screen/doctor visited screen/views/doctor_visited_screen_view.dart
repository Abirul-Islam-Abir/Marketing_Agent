import '../../../../data/const/export.dart';

class DoctorVisitedScreenView extends StatelessWidget {
  DoctorVisitedScreenView({Key? key}) : super(key: key);
  final controler = Get.put(DoctorOnboardScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar(
           'Doctor Visited'
          ),
      body: GetBuilder<DoctorOnboardScreenController>(builder: (controller) {
        final data = controller.doctorVisitedList;
        return controller.isProgress
            ? const ShimmerTargetList()
            : RefreshIndicator(
                onRefresh: () async {
                  controller.initializeMethod();
                },
                child: SizedBox( height: double.infinity,
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => DoctorOnboardCard(
                      location: data[index]['doctor_name'],
                      date: '10/10/2024',
                    ),
                  ),
                ),
              );
      }),
    );
  }
}