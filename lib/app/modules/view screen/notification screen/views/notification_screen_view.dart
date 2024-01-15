import 'package:amin_agent/app/modules/view%20screen/notification%20screen/components/build_listview.dart';

import '../../../../data/const/export.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  NotificationScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppbar(AppString.notification),
      backgroundColor: AppColor.kScaffold,
      body: Center(
        child: SizedBox(
          width: Get.width / 0.6,
          child: SalesTargetListView(list: salesTargetGroupList,),
        ),
      ),
    );
  }
}


