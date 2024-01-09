import 'package:get/get.dart';

import '../controllers/commission_report_screen_controller.dart';

class TotalCommissionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TotalCommissionScreenController>(
      () => TotalCommissionScreenController(),
    );
  }
}
