import 'package:amin_agent/app/modules/auth%20screen/forget%20password%20screen/controller/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordScreenController());
  }
}