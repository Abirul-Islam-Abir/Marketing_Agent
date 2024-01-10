import 'package:amin_agent/app/data/utils/store_data.dart';

import '../../../../api services/auth/forgot_password.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/awesome_dialog.dart';

class ForgetPasswordScreenController extends GetxController {
  final number = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;


  Future forgotPassword(context) async {
    final response = await forgotPasswordRequest(number: number.text);
    if (response['success'] == true) {
      StoreData.saveNumber(number.text);
      Get.toNamed(RouteName.passwordSetScreen,
          arguments: {'id': '${response['data']['user_id']}'});

    } else {
      AwesomeDialogs.showErrorDialog(context,desc: response['data']['password'][0]);
    }
  }

  Future<void> forgotPasswordInitializeMethod(context) async {
    _isProgress.value = true ;
    try {
      await Future.wait([forgotPassword(context)]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = true ;
    }
  }

  void validateMethod(context) {
    if (formKey.currentState!.validate()) {
      forgotPasswordInitializeMethod(context);
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
