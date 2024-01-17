import '../../../../data/const/export.dart';

class OtpVerifyScreenController extends GetxController {
  final TextEditingController otp = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  FocusNode otpFocus = FocusNode();
  RxBool hasError = false.obs;
  String currentText = "";
  RxBool _isCompleted = true.obs;
 String errorText = '';
  final formKey = GlobalKey<FormState>();
  final RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;
  bool get isCompleted => _isCompleted.value;
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
    if (id['forgot'] == true) {
      final response =
          await resetPassOtpManageRequest(id: id['id'], otp: otp.text);
      if (response['success'] == true) {
        await StoreData.saveId(response['data']['user_id'].toString());
        Get.toNamed(RouteName.passwordSetScreen, arguments: {
          'id': response['data']['user_id'].toString(),
          'otp': response['data']['reset_otp'].toString()
        });
      } else {
        errorText = response['message'];
        // AwesomeDialogs.showErrorDialog(context, desc: response['message']);
      }
    } else {
      final response = await verifyOtpRequest(id: id['id'], otp: otp.text);
      if (response['success'] == true) {
        StoreData.saveToken(response['data']['token'].toString());
        StoreData.saveId(response['data']['user_id'].toString());
        Get.offAllNamed(RouteName.bottomNav);
      } else {
        errorText = response['message'];
        /*otp.clear();*/
      //  AwesomeDialogs.showErrorDialog(context, desc: response['message']);
      }
    }
  }
otpRemovedValidate(){
    _isCompleted.value = true;
}
  Future resendOtp(context) async {
    final response = await resendOtpRequest(id: id['id']);
    if (response['success'] == true) {
      startCountdown();
    } else {
      AwesomeDialogs.showErrorDialog(context,
          desc: response['data']['phone'][0]);
      return '';
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
    otpFocus.unfocus();
    _isCompleted.value = false;
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
    otpFocus.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    _timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }
}
