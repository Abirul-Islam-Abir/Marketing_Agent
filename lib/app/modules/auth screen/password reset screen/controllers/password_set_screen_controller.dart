import 'package:amin_agent/app/api%20services/auth/reset_password.dart';
import 'package:amin_agent/app/data/const/export.dart';


// PasswordSetScreenController is a GetX controller for managing the password setting/resetting screen.
class PasswordSetScreenController extends GetxController {
  // Get the arguments passed to this controller (likely the OTP and user ID)
  final id = Get.arguments;

  // GlobalKey for the Form widget to control its state
  final formKey = GlobalKey<FormState>();

  // TextEditingController for password and confirm password fields
  final password = TextEditingController();
  final cPassword = TextEditingController();

  // FocusNode for password and confirm password fields
  final passwordFocus = FocusNode();
  final cPasswordFocus = FocusNode();

  // RxBool for tracking whether the password setting process is in progress
  final RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;

  // RxBool for tracking password visibility
  final RxBool _isSecurePass = true.obs;
  final RxBool _isSecureCPass = true.obs;

  bool get isSecurePass => _isSecurePass.value;
  bool get isSecureCPass => _isSecureCPass.value;

  // Method to toggle password visibility for the password field
  void isSecurePassChange() {
    _isSecurePass.value = !_isSecurePass.value;
  }

  // Method to toggle password visibility for the confirm password field
  void isSecureCPassChange() {
    _isSecureCPass.value = !_isSecureCPass.value;
  }

  // Method to handle the password reset process
  Future resetPassword(context) async {
    final response = await resetPasswordRequest(
        otp: id['otp'], password: password.text, id: id['id']);
    if (response['success'] == true) {
      // Save the token and navigate to the bottom navigation screen
      await StoreData.saveToken(response['data']['token']);
      AwesomeDialogs.showSuccessDialog(context, desc: 'Log in successfully');
      Get.offAllNamed(RouteName.bottomNav);
    } else {
      // Show an error dialog if the password reset fails
      AwesomeDialogs.showErrorDialog(context,
          desc: response['data']['password'][0]);
    }
  }

  // Method to initiate the password reset process with progress indication
  Future<void> resetPasswordInitializeMethod(context) async {
    _isProgress.value = true;
    try {
      // Wait for the password reset process to complete
      await Future.wait([
        resetPassword(context),
      ]);
    } catch (e) {
      // Handle exceptions if any
      throw Exception('$e');
    } finally {
      // Set progress to false once the process is complete
      _isProgress.value = false;
    }
  }

  // Method to validate the form and initiate the password reset process
  void validateMethod(context) {
    // Unfocus the confirm password field
    cPasswordFocus.unfocus();

    // Check if the form is valid
    if (formKey.currentState!.validate()) {
      // Check if password and confirm password match
      if (cPassword.text == password.text) {
        // Initiate the password reset process
        resetPasswordInitializeMethod(context);
      } else {
        // Show an error dialog if passwords do not match
        AwesomeDialogs.showErrorDialog(context,
            desc: 'Password did not match');
      }
    }
  }

  @override
  void dispose() {
    // Dispose of controllers and focus nodes to free up resources
    password.dispose();
    cPassword.dispose();
    passwordFocus.dispose();
    cPasswordFocus.dispose();
    super.dispose();
  }
}

