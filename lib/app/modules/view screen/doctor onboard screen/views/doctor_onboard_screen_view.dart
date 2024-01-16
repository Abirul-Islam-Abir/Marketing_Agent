import 'package:amin_agent/app/modules/widgets/appbar.dart';

import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';

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
        body: OnboardListView(
          list: doctorOnboardDataList,
        ),
      );
}
