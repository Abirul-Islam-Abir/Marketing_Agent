import 'package:get/get.dart';

import '../controller/profile_details_screen_controller.dart';

class ProfileDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileDetailsScreenController());
  }
}