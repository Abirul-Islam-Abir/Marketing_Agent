import 'package:amin_agent/app/modules/auth%20screen/otp%20verify%20screen/controller/otp_verify_controller.dart';
import 'package:get/get.dart';

class OtpVerifyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpVerifyScreenController());
  }
}