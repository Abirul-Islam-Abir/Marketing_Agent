import 'package:get/get.dart';

import '../controllers/sales_report_screen_controller.dart';

class SalesReportScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesReportScreenController>(
      () => SalesReportScreenController(),
    );
  }
}
