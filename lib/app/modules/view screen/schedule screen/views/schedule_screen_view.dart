

import 'package:amin_agent/app/modules/view%20screen/schedule%20screen/components/shedule_listview.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';

class ScheduleScreenView extends GetView<ScheduleScreenController> {
  ScheduleScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ScheduleScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: buildSecondaryAppbar('Schedule'),
      body: Center(
        child: SizedBox(
          width: Get.width / 0.6,
          child: SheduleListView(list: scheduleList),
        ),
      ),
    );
  }
}


