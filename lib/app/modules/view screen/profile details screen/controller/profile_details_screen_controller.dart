import 'dart:io';

import 'package:amin_agent/app/data/const/export.dart';

import '../../../../api services/profile/update_nid.dart';
import '../../../../api services/profile/update_passport.dart';
 import 'package:file_picker/file_picker.dart';

class ProfileDetailsScreenController extends GetxController {
  /*
  * Pick a pdf file and upload
  * call method after upload method in the code when file is already uploaded
  * */
  bool _isNid = false;
  bool _isPassport = false;

  bool get isNid => _isNid;

  bool get isPassport => _isPassport;

  void nid(v) {
    _isNid = v;
    update();
  }

  void passport(v) {
    _isPassport = v;
    update();
  }

  Future uploadNidFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      nid(true);
      File file = File(result.files.single.path!);
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final response =
            await uploadNIDFileRequest(filePath: file, token: token);
        if (response['success'] == true) {
          await Get.find<ProfileScreenController>().userProfile();
          Get.snackbar('Good Job!', response['message']);
          nid(false);
        } else {
          nid(false);
          Get.snackbar(
              'Wrong!', 'The passport pdf field must be a file of type: pdf.',
              backgroundColor: AppColor.kRedColor);
        }
      } else {
        nid(false);
      }
    } else {
      nid(false);
    }
  }

  Future uploadPassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      passport(true);
      File file = File(result.files.single.path!);
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final response =
            await updatePassportRequest(filePath: file, token: token);
        if (response['success'] == true) {
          await Get.find<ProfileScreenController>().userProfile();
          Get.snackbar('Good Job!', response['message']);
          passport(false);
        } else {
          passport(false);
          Get.snackbar(
              'Wrong!', 'The passport pdf field must be a file of type: pdf.',
              backgroundColor: AppColor.kRedColor);
        }
      } else {
        passport(false);
      }
    } else {
      passport(false);
    }
  }
}