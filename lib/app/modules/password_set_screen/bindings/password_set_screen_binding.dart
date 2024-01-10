import 'package:get/get.dart';

import '../controllers/password_set_screen_controller.dart';

class PasswordSetScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordSetScreenController>(
      () => PasswordSetScreenController(),
    );
  }
}
