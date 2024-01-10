import 'dart:async';

import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../api services/auth/resend_otp.dart';
import '../../../../api services/auth/verify_otp.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/awesome_dialog.dart';

class OtpVerifyScreenController extends GetxController {
  final TextEditingController otp = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  final id = Get.arguments;
  var countdown = 60.obs;
  late Timer _timer;
  RxBool isTimeOut = true.obs;
  Future resendOtp() async {
    final response = await resendOtpRequest(id: id['id']);
    if (response['success'] == true) {
      startCountdown();
    } else {
      AwesomeDialogs.showErrorDialog(desc: response['data']['phone'][0]);

    }
  }

  void startCountdown() {
    countdown.value = 10;
    isTimeOut.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
        if (countdown.value == 0) {
          isTimeOut.value = true;
        }
      } else {
        isTimeOut.value = false;
        _timer.cancel();
      }
    });
  }

  Future verifyOtp() async {
    final response = await verifyOtpRequest(id: id['id'], otp: otp.text);
    if (response['success'] == true) {
       StoreData.saveToken(response['data']['token']);
       StoreData.saveId(id['id']);
      await setUserTokenAndId();
      Get.offAllNamed(RouteName.bottomNav);
      Get.snackbar('Success', response['message']);
    } else {
      otp.clear();
      AwesomeDialogs.showErrorDialog(desc: response['message']);
    }
  }

  Future<void> otpVerifyInitializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        verifyOtp(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
    startCountdown();
  }

  @override
  void dispose() {
    errorController!.close();
    otp.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    _timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }
}
