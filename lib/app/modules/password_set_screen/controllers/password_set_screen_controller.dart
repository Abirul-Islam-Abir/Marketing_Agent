import 'package:amin_agent/app/api%20services/auth/reset_password.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:get/get.dart';

import '../../../data/utils/awesome_dialog.dart';

class PasswordSetScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otp = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();
  RxBool _isProgress = false.obs;

  bool get isProgress => _isProgress.value;
  final id = Get.arguments;

  Future resetPassword() async {
    final response = await resetPasswordRequest(
        otp: otp.text, password: password.text, id: id['id']);
    if (response['success'] == true) {
      Get.toNamed(RouteName.bottomNav);
    } else {
      AwesomeDialogs.showErrorDialog(desc: response['data']['password'][0]);
    }
  }

  Future<void> resetPasswordInitializeMethod( ) async {
    _isProgress.value = true;
    try {
      await Future.wait([
        resetPassword(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = false;
    }
  }

  void validateMethod( ) {
    if (formKey.currentState!.validate()) {
      resetPasswordInitializeMethod( );
    } else {
      Get.snackbar('Ohh..', 'Required field');
    }
  }

  @override
  void dispose() {
    otp.dispose();
    password.dispose();
    cPassword.dispose();
    super.dispose();
  }
}
