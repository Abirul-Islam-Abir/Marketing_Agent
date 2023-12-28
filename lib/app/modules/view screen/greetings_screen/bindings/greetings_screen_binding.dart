import 'package:get/get.dart';

import '../controllers/greetings_screen_controller.dart';

class GreetingsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GreetingsScreenController>(
      () => GreetingsScreenController(),
    );
  }
}
