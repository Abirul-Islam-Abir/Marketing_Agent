import 'package:get/get.dart';

import '../controllers/total_sales_screen_controller.dart';

class TotalSalesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TotalSalesScreeenController>(
      () => TotalSalesScreeenController(),
    );
  }
}
