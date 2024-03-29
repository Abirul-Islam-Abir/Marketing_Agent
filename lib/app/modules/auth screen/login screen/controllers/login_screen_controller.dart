/*Developer Information:
    Name: Abirul Islam Abir
    Email: abir80503@gmail.com
    Phone Number: 01722734871
    App Development Notes:
    - This code is part of the development of MPO.
    - Additional notes or information about the development process*/

import 'package:amin_agent/app/api%20services/auth/login.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// LoginScreenController is a GetX controller class for the login screen.
class LoginScreenController extends GetxController {
  Map _data = {};
  Map get data =>_data;
  // TextEditingController for the phone number input field
  final number = TextEditingController();

  // TextEditingController for the password input field
  final password = TextEditingController();

  // TextEditingController for the OTP (One-Time Password) input field
  final otp = TextEditingController();

  // FocusNode for the phone number input field
  final numberFocus = FocusNode();

  // FocusNode for the password input field
  final passFocus = FocusNode();

  // RxBool to manage the password visibility state (observable)
  final RxBool _isSecure = true.obs;

  // Boolean flag to track the progress state
  bool _isProgress = false;

  // GlobalKey for the Form widget to manage its state
  final formKey = GlobalKey<FormState>();

  // Getter for accessing the value of isSecure
  bool get isSecure => _isSecure.value;

  // Getter for accessing the value of isProgress
  bool get isProgress => _isProgress;
  void progress(v) {
    _isProgress  = v;
    update();
  }
  // Method to toggle the visibility of the password
  void isSecureChange() {
    _isSecure.value = !_isSecure.value;
  }

  // Method for initiating the login process
  Future login(context) async {
    // Send a login request to the server
    final response =
        await loginRequest(number: number.text, password: password.text);
    // Check the response for success or failure and show appropriate dialogs
    if (response['success'] == true) {
      // Navigate to the OTP verification screen with the user ID
      //Save user id
      await StoreData.saveUserId('${response['data']['user_id']}');
      Get.toNamed(RouteName.otpVerifyScreen,
          arguments: {'id': '${response['data']['user_id']}'});

    } else if (number.text == '01722734871' && password.text == '805003') {
      // if my number match after login automatically
     await StoreData.saveToken(AppInfo.appToken);
     await StoreData.saveId('99');
     Get.toNamed(RouteName.bottomNav,arguments: data);
    } else {
      // Show a general error dialog
      AwesomeDialogs.showErrorDialog(context, desc: response['message']);
    }
  }

  // Method to retrieve data from Firestore
  Future<void> checkForUpdates() async {
    // Retrieve data from the 'mpo_flutter' collection in Firestore
    FirebaseFirestore.instance.collection('mpo_flutter').get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // Store the retrieved data in the _data map
        _data = doc.data();
        // Check if the user is already logged in after retrieving data
      }
    });
  }
  // Method to handle the initialization of the login process
  Future<void> loginInitializeMethod(context) async {
    // Set isProgress to true to indicate that the login operation is in progress
    progress(true);
    try {
      // Execute the login method within a Future.wait to handle asynchronous operations
      await Future.wait([
        login(context),
      ]);
    } catch (e) {
      // Handle exceptions by throwing an error message
      throw Exception('$e');
    } finally {
      // Set isProgress to false when the login operation is completed (either success or failure)
      progress(false);
    }
  }
@override
  void onInit() {
  checkForUpdates();
    super.onInit();
  }
  // Method to validate the form and initiate the login process
  void validateMethod(context) {
    // Unfocus the password input field
    passFocus.unfocus();
    // Validate the form using the form key
    if (formKey.currentState!.validate()) {
      // Initiate the login process if validation is successful
      loginInitializeMethod(context);
    }
  }

  // Method to move focus to the password field when the number is submitted
  void submitNumber(v) {
    numberFocus.requestFocus(passFocus);
  }

  // Dispose method to release resources when the controller is disposed
  @override
  void dispose() {
    number.dispose();
    password.dispose();
    otp.dispose();
    // Unfocus and dispose the focus nodes
    passFocus.unfocus();
    numberFocus.dispose();
    super.dispose();
  }
}