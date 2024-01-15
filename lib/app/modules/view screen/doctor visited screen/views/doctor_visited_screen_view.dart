 import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';
import '../controllers/doctor_visited_screen_controller.dart';

class DoctorVisitedScreenView extends GetView<DoctorVisitedScreenController> {
  const DoctorVisitedScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor, // Replace with your color
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
             children: [
                SecondaryAppBar(text: 'Doctor Visited',filterTap: () => Get.dialog(FilterScreenView())),
              ListViewBuilder(
                list: doctorOnboardDataList,
              )
            ],
          ),
        ),
      ),
    );
  }
}
