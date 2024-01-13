
import '../../../../api services/auth/forgot_password.dart';
import '../../../../data/const/export.dart';

class ForgetPasswordScreenController extends GetxController {
  final number = TextEditingController();
final numberFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  final RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;


  Future forgotPassword(context) async {
    final response = await forgotPasswordRequest(number: number.text);
    if (response['success'] == true) {
      Get.toNamed(RouteName.otpVerifyScreen,
          arguments: {'id': '${response['data']['user_id']}',
            'forgot': true
      });

    }else if(response['success']==false){
      AwesomeDialogs.showErrorDialog(context,desc: response['message']);

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
      _isProgress.value = false ;
    }
  }

  void validateMethod(context) {
    if (formKey.currentState!.validate()) {
      forgotPasswordInitializeMethod(context);
    }
  }

  @override
  void dispose() {
    number.dispose();
    numberFocus.dispose();
    super.dispose();
  }
}
