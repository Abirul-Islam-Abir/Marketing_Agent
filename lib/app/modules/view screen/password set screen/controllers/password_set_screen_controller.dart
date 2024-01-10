import 'package:amin_agent/app/api%20services/auth/reset_password.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';

import '../../../../data/utils/awesome_dialog.dart';


class PasswordSetScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otp = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();
  final RxBool _isProgress = false.obs;

  bool get isProgress => _isProgress.value;
  final id = Get.arguments;

  Future resetPassword(context) async {
    final response = await resetPasswordRequest(
        otp: otp.text, password: password.text, id: id['id']);
    if (response['success'] == true) {
      StoreData.saveToken(response['data']['token']);
      StoreData.saveId(id['id']);
      StoreData.savePassword(password.text);
      await setNumberAndPassword();
      await setUserTokenAndId();
      Get.offAllNamed(RouteName.bottomNav);
    } else {
      AwesomeDialogs.showErrorDialog(context,desc: response['data']['password'][0]);
    }
  }

  Future<void> resetPasswordInitializeMethod(context ) async {
    _isProgress.value = true;
    try {
      await Future.wait([
        resetPassword(context),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = false;
    }
  }

  void validateMethod(context ) {
    if (formKey.currentState!.validate()) {
      resetPasswordInitializeMethod( context);
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
