import 'package:amin_agent/app/modules/view%20screen/notification%20screen/components/build_listview.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';

class NotificationScreenView extends GetView<NotificationScreenController> {
  NotificationScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar(AppString.notification),
      body: NotificationListView(
        list: notificationList,
      ),
    );
  }
}
