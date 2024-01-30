/***Developer Information:
    Name: Abirul Islam Abir
    Email: abir80503@gmail.com
    Phone Number: 01722734871
    App Development Notes:
    - This code is part of the development of MPO.
    - Additional notes or information about the development process*/
import '../../../../api services/auth/forgot_password.dart';
import '../../../../data/const/export.dart';

// ForgetPasswordScreenController is a GetX controller class for the forget password screen.
class ForgetPasswordScreenController extends GetxController {
  // TextEditingController for the phone number input field
  final number = TextEditingController();

  // FocusNode for the phone number input field
  final numberFocus = FocusNode();

  // GlobalKey for the Form widget to manage its state
  final formKey = GlobalKey<FormState>();

  // RxBool to manage the progress state (observable)
  final RxBool _isProgress = false.obs;

  // Getter for accessing the value of isProgress
  bool get isProgress => _isProgress.value;

  // Method for initiating the forgot password process
  Future forgotPassword(context) async {
    // Call the forgotPasswordRequest to send a request to the server
    final response = await forgotPasswordRequest(number: number.text);

    // Check the response for success or failure
    if (response['success'] == true) {
      // Navigate to the OTP verification screen with user ID and flag indicating it's for forgot password
      await StoreData.saveUserId('${response['data']['user_id']}');
      Get.toNamed(RouteName.otpVerifyScreen, arguments: {
        'id': '${response['data']['user_id']}',
        'forgot': true,
      });
    } else if (response['success'] == false) {
      // Show an error dialog if the request is unsuccessful with the provided message
      AwesomeDialogs.showErrorDialog(context, desc: response['message']);
    } else {
      // Show an error dialog if there is an issue with the password field in the response data
      AwesomeDialogs.showErrorDialog(context,
          desc: response['data']['password'][0]);
    }
  }

  void progress(v) {
    _isProgress.value = v;
  }

  // Method to handle the initialization of the forgot password process
  Future<void> forgotPasswordInitializeMethod(context) async {
    // Set isProgress to true to indicate that the operation is in progress
    progress(true);
    try {
      // Execute the forgotPassword method within a Future.wait to handle asynchronous operations
      await Future.wait([forgotPassword(context)]);
    } catch (e) {
      // Handle exceptions by throwing an error message
      throw Exception('$e');
    } finally {
      // Set isProgress to false when the operation is completed (either success or failure)

      progress(false);
    }
  }

  // Method to validate the form and initiate the forgot password process
  void validateMethod(context) {
    if (formKey.currentState!.validate()) {
      forgotPasswordInitializeMethod(context);
    }
  }

  // Dispose method to release resources when the controller is disposed
  @override
  void dispose() {
    number.dispose();
    numberFocus.dispose();
    super.dispose();
  }
}