import 'dart:async';

import 'package:amin_agent/app/api%20services/auth/reset_pass_otp_manage.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';
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
  RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;
  final id = Get.arguments;
  var countdown = 60.obs;
  late Timer _timer;
  RxBool isTimeOut = true.obs;

  void startCountdown() {
    countdown.value = 120;
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

  Future verifyOtp(context) async {
    print(id['forgot']);
    if (id['forgot'] == true) {
      final response =
          await resetPassOtpManageRequest(id: id['id'], otp: otp.text);
      if (response['success'] == true) {
        Get.snackbar('Success', response['message']);
         Get.toNamed(RouteName.passwordSetScreen, arguments: {
          'id': response['data']['user_id'].toString(),
          'otp': response['data']['reset_otp'].toString()
        });
      } else {
        AwesomeDialogs.showErrorDialog(context, desc: response['message']);
      }
    } else {
      final response = await verifyOtpRequest(id: id['id'], otp: otp.text);
      if (response['success'] == true) {
        StoreData.saveToken(response['data']['token']);
        await setUserTokenAndId();
        Get.snackbar('Success', response['message']);
        Get.offAllNamed(RouteName.bottomNav);
      } else {
        otp.clear();
        AwesomeDialogs.showErrorDialog(context, desc: response['message']);
      }
    }
  }

  Future resendOtp(context) async {
    final response = await resendOtpRequest(id: id['id']);
    if (response['success'] == true) {
      startCountdown();
    } else {
      AwesomeDialogs.showErrorDialog(context,
          desc: response['data']['phone'][0]);
    }
  }

  Future<void> otpVerifyInitializeMethod(context) async {
    _isProgress.value = true;
    try {
      await Future.wait([
        verifyOtp(context),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = false;
    }
  }

  void validateSubmit(context) {
    if (formKey.currentState!.validate()) {
      otpVerifyInitializeMethod(context);
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
