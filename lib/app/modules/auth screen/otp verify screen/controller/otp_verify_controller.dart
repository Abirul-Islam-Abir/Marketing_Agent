import '../../../../data/const/export.dart';

class OtpVerifyScreenController extends GetxController {
  final TextEditingController otp = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  FocusNode otpFocus = FocusNode();
  RxBool hasError = false.obs;
  String currentText = "";
  final RxBool _isCompleted = true.obs;
  RxString errorText = ''.obs;
  final formKey = GlobalKey<FormState>();
  final RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;
  bool get isCompleted => _isCompleted.value;
  final id = Get.arguments;
  var countdown = 120.obs;
  late Timer _timer;
  RxBool isTimeOut = true.obs;
  void timeOut(v){
    isTimeOut.value = v;
  }
  // Start the countdown timer for OTP expiration
  void startCountdown() {
    countdown.value = 120;
    timeOut(true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
        if (countdown.value == 0) {
          timeOut(true);
        }
      } else {
        timeOut(false);
        _timer.cancel();
      }
    });
  }

  // Verify OTP logic
  Future verifyOtp(context) async {
    if (id['forgot'] == true) {
      final response =
          await resetPassOtpManageRequest(id: id['id'], otp: otp.text);
      if (response['success'] == true) {
        await StoreData.saveId(response['data']['user_id'].toString());
        // Navigate to the password set screen with user ID and OTP
        Get.toNamed(RouteName.passwordSetScreen, arguments: {
          'id': response['data']['user_id'].toString(),
          'otp': response['data']['reset_otp'].toString()
        });
      } else {
        otp.clear();
        errorText.value = response['message'];
        hasError.value = true;
        errorController!.add(ErrorAnimationType.shake);
        otpFocus.requestFocus();
        // Handle error (e.g., show error dialog)
      }
    } else {
      final response = await verifyOtpRequest(id: id['id'], otp: otp.text);
      if (response['success'] == true) {
        // Save token and user ID, then navigate to the bottom navigation screen
        StoreData.saveToken(response['data']['token'].toString());
        StoreData.saveId(response['data']['user_id'].toString());
        Get.offAllNamed(RouteName.bottomNav);
      } else {
        otp.clear();
        errorText.value = response['message'];
        hasError.value = true;
        otpFocus.requestFocus();
        // Handle error (e.g., show error dialog)
      }
    }
  }

  // Resend OTP logic
  Future resendOtp(context) async {
    final response = await resendOtpRequest(id: id['id']);
    if (response['success'] == true) {
      startCountdown();
    } else {
      // Handle error (e.g., show error dialog)
      AwesomeDialogs.showErrorDialog(context,
          desc: response['data']['phone'][0]);
      return '';
    }
  }
void progress(v){
  _isProgress.value = v;
}
  // Initialize the OTP verification process
  Future<void> otpVerifyInitializeMethod(context) async {
    progress(true);
    try {
      await Future.wait([
        verifyOtp(context),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      progress(false);
    }
  }

  // Validate and submit the OTP
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
