import 'dart:io';

import 'package:amin_agent/app/data/const/export.dart';

import '../../../../api services/profile/update_nid.dart';
import '../../../../api services/profile/update_passport.dart';
 import 'package:file_picker/file_picker.dart';

class ProfileDetailsScreenController extends GetxController {
  // Variables to track whether NID and passport files are being uploaded
  bool _isNid = false;
  bool _isPassport = false;

  // Getters for accessing the status of NID and passport uploads
  bool get isNid => _isNid;
  bool get isPassport => _isPassport;

  // Method to update the status of NID upload
  void nid(v) {
    _isNid = v;
    update();
  }

  // Method to update the status of passport upload
  void passport(v) {
    _isPassport = v;
    update();
  }

  // Method to upload NID file
  Future uploadNidFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Set NID upload status to true
      nid(true);
      // Retrieve the picked file
      File file = File(result.files.single.path!);
      // Retrieve user authentication token
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        // Call the API to upload NID file
        final response = await uploadNIDFileRequest(filePath: file, token: token);
        if (response['success'] == true) {
          // Refresh user profile data after successful upload
          await Get.find<ProfileScreenController>().userProfile();
          // Show success snackbar
          Get.snackbar('Good Job!', response['message']);
          // Set NID upload status to false
          nid(false);
        } else {
          // Show error snackbar if the upload fails
          nid(false);
          Get.snackbar('Wrong!', 'The NID pdf field must be a file of type: pdf.',
              backgroundColor: AppColor.kRedColor);
        }
      } else {
        // Set NID upload status to false if authentication token is null
        nid(false);
      }
    } else {
      // Set NID upload status to false if no file is picked
      nid(false);
    }
  }

  // Method to upload passport file
  Future uploadPassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Set passport upload status to true
      passport(true);
      // Retrieve the picked file
      File file = File(result.files.single.path!);
      // Retrieve user authentication token
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        // Call the API to upload passport file
        final response = await updatePassportRequest(filePath: file, token: token);
        if (response['success'] == true) {
          // Refresh user profile data after successful upload
          await Get.find<ProfileScreenController>().userProfile();
          // Show success snackbar
          Get.snackbar('Good Job!', response['message']);
          // Set passport upload status to false
          passport(false);
        } else {
          // Show error snackbar if the upload fails
          passport(false);
          Get.snackbar('Wrong!', 'The passport pdf field must be a file of type: pdf.',
              backgroundColor: AppColor.kRedColor);
        }
      } else {
        // Set passport upload status to false if authentication token is null
        passport(false);
      }
    } else {
      // Set passport upload status to false if no file is picked
      passport(false);
    }
  }
}