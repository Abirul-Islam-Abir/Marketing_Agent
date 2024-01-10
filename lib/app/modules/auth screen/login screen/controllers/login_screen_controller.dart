import 'package:amin_agent/app/api%20services/auth/login.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/data/utils/awesome_dialog.dart';


class LoginScreenController extends GetxController {
  final number = TextEditingController(text: '01722734871');
  final password = TextEditingController(text: '12345678');
  final otp = TextEditingController();

  bool _isProgress = false;
  final formKey = GlobalKey<FormState>();

  bool get isProgress => _isProgress;

  Future login(context) async {
    final response =
        await loginRequest(number: number.text, password: password.text);
    if (response['success'] == true) {
      Get.toNamed(RouteName.otpVerifyScreen,
          arguments: {'id': '${response['data']['user_id']}'});
    } else if (response['message'] == 'Validation error.') {
      AwesomeDialogs.showErrorDialog(desc: response['data']['phone'][0]);
    } else if (response['message'] == 'Invalid password.') {
      AwesomeDialogs.showErrorDialog(desc: response['message']);
    } else {
      AwesomeDialogs.showErrorDialog(desc: response['data']['password'][0]);
    }
  }





  Future<void> loginInitializeMethod(context) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        login(context),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }

  void validateMethod(context) {
    if (formKey.currentState!.validate()) {
      loginInitializeMethod(context);
    } else {
      Get.snackbar('Ohh..', 'Required field');
    }
  }
@override
  void dispose() {
  number.dispose();
  password.dispose();
  otp.dispose();
     super.dispose();
  }
}
