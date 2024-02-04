import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';

import '../../../../data/const/export.dart';

class DoctorOnboardScreenView extends StatelessWidget {
  DoctorOnboardScreenView({Key? key}) : super(key: key);
  final controller = Get.put(DoctorOnboardScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildNavigateAppbar('Doctor Onboard'),
        body: GetBuilder<DoctorOnboardScreenController>(builder: (controller) {
          final data = controller.doctorOnboardList;
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
                          itemBuilder: (context, index) {
                            final name = data[index]['doctor_name'];
                            final date = data[index]['completed_date'];
                            const time = '09:10 PM';
                            return DoctorOnboardCard(
                              time: time,
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