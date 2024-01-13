 import '../../../../data/const/export.dart';
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
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SecondaryAppBar(text: 'Doctor Visited'),
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
