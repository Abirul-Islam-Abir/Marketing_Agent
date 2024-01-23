import 'package:get/get.dart';

import '../controllers/agents _screen_controller.dart';

class AgentsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentsScreenController>(
      () => AgentsScreenController(),
    );
  }
}
