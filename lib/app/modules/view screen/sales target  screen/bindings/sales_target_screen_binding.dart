import 'package:get/get.dart';

import '../controllers/sales_target _screen_controller.dart';

class SalesTargetScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesTargetScreenController>(
      () => SalesTargetScreenController(),
    );
  }
}
