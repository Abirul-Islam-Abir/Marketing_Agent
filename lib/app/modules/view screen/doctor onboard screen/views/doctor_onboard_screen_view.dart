

import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';

class DoctorOnboardScreenView extends GetView<DoctorOnboardScreenController> {
  const DoctorOnboardScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
               children: [
                  SecondaryAppBar(text: 'Doctor Onboard',filterTap: () => Get.dialog(FilterScreenView())),
                OnboardListView(
                  list: doctorOnboardDataList,
                )
              ],
            ),
          ),
        ),
      );
}
