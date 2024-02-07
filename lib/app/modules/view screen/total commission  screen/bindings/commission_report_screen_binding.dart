import 'package:get/get.dart';

import '../controllers/total_commission_screen_controller.dart';

class TotalCommissionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TotalCommissionScreenController>(
      () => TotalCommissionScreenController(),
    );
  }
}