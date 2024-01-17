import 'package:amin_agent/app/modules/widgets/appbar.dart';

import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';
import '../components/doctor_onboard_card.dart';

class DoctorOnboardScreenView extends GetView<DoctorOnboardScreenController> {
  const DoctorOnboardScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildFilterAppBar(
            text: 'Doctor Onboard',
            filterTap: () {
              Get.dialog(FilterScreenView());
            }),
        body: ListView.builder(
          itemCount: doctorOnboardDataList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => DoctorOnboardCard(
            location: doctorOnboardDataList[index].name,
            date: doctorOnboardDataList[index].date,
          ),
        )
      );
}
