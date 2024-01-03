import 'package:get/get.dart';

import '../controllers/sales_target_group_screen_controller.dart';

class SalesTargetGroupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesTargetGroupScreenController>(
      () => SalesTargetGroupScreenController(),
    );
  }
}
