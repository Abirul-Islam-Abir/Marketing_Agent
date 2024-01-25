import 'package:get/get.dart';

import '../controllers/targets_agents _screen_controller.dart';

class TargetAgentsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentsScreenController>(
      () => AgentsScreenController(),
    );
  }
}
