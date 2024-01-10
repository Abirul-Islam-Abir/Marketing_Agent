import 'package:amin_agent/app/api%20services/auth/resend_otp.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';

import '../../../../api services/auth/forgot_password.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/awesome_dialog.dart';

class ForgetPasswordScreenController extends GetxController {
  final number = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;


  Future forgotPassword() async {
    final response = await forgotPasswordRequest(number: number.text);
    if (response['success'] == true) {
      Get.toNamed(RouteName.passwordSetScreen,
          arguments: {'id': '${response['data']['user_id']}'});
    } else {
      AwesomeDialogs.showErrorDialog(desc: response['data']['password'][0]);
    }
  }

  Future<void> forgotPasswordInitializeMethod() async {
    _isProgress.value = true ;
    try {
      await Future.wait([forgotPassword()]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = true ;
    }
  }

  void validateMethod() {
    if (formKey.currentState!.validate()) {
      forgotPasswordInitializeMethod();
    } else {
      Get.snackbar('Ohh..', 'Required field');
    }
  }

  @override
  void dispose() {
    number.dispose();
    super.dispose();
  }
}
