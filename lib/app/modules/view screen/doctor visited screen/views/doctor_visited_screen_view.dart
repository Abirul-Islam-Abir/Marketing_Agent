
import '../../../../data/const/export.dart';

class DoctorVisitedScreenView extends StatelessWidget {
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
