import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';

import '../../../../data/const/export.dart';

class DoctorVisitedScreenView extends StatelessWidget {
  DoctorVisitedScreenView({Key? key}) : super(key: key);
  final controler = Get.put(DoctorOnboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar('Doctor Visited'),
      body: GetBuilder<DoctorOnboardScreenController>(builder: (controller) {
        final data = controller.doctorVisitedList;
        return controller.isProgress
            ? const ShimmerTargetList()
            : data.isEmpty
                ? EmptyListText()
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.initializeMethod();
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => DoctorOnboardCard(
                          time: '04:21 PM',
                          location: data[index]['doctor_name'],
                          date: data[index]['completed_date'],
                        ),
                      ),
                    ),
                  );
      }),
    );
  }
}