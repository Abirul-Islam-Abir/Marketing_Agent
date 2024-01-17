import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';
import '../../doctor onboard screen/components/doctor_onboard_card.dart';
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
      body:  ListView.builder(
        itemCount: doctorOnboardDataList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => DoctorOnboardCard(
          location: doctorOnboardDataList[index].name,
          date: doctorOnboardDataList[index].date,
        ),
      )
    );
  }
}
