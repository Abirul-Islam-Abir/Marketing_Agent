import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';
import '../../filter screen/views/filter_screen_view.dart';
import '../controllers/doctor_visited_screen_controller.dart';

class DoctorVisitedScreenView extends GetView<DoctorVisitedScreenController> {
  const DoctorVisitedScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildFilterAppBar(
          text: 'Doctor Visited',
          filterTap: () {
            Get.dialog(FilterScreenView());
          }),
      body: OnboardListView(list: doctorOnboardDataList),
    );
  }
}
