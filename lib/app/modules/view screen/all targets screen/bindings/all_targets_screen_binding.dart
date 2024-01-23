import 'package:get/get.dart';

import '../controllers/all_targets_screen_controller.dart';

class AllTargetsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTargetsScreenController>(
      () => AllTargetsScreenController(),
    );
  }
}
