import '../../../../data/const/export.dart';

class DoctorOnboardScreenView extends StatelessWidget {
  DoctorOnboardScreenView({Key? key}) : super(key: key);
  final controller = Get.put(DoctorOnboardScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildNavigateAppbar(
            'Doctor Onboard'
             ),
        body: GetBuilder<DoctorOnboardScreenController>(builder: (controller) {
          final data = controller.doctorOnboardList;
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