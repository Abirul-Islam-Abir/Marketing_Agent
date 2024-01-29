import 'dart:io';

import 'package:amin_agent/app/data/const/export.dart';

import '../../../../api services/profile/update_nid.dart';
import '../../../../api services/profile/update_passport.dart';
import '../../../../data/utils/user_data_key.dart';
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
  Future uploadNidFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _isNid = true;
      update();
      File file = File(result.files.single.path!);
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final response =
            await uploadNIDFileRequest(filePath: file, token: token);
        if (response['success'] == true) {
          await Get.find<ProfileScreenController>().userProfile();
          Get.snackbar('Good Job!', response['message']);
          _isNid = false;
          update();
        } else {
          _isNid = false;
          update();
          Get.snackbar(
              'Wrong!', 'The passport pdf field must be a file of type: pdf.',
              backgroundColor: AppColor.kRedColor);
        }
      } else {
        _isNid = false;
        update();
      }
    } else {
      _isNid = false;
      update();
    }
  }

  Future uploadPassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _isPassport = true;
      update();
      File file = File(result.files.single.path!);
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final response =
            await updatePassportRequest(filePath: file, token: token);
        if (response['success'] == true) {
          await Get.find<ProfileScreenController>().userProfile();
          Get.snackbar('Good Job!', response['message']);
          _isPassport = false;
          update();
        } else {
          _isPassport = false;
          update();
          Get.snackbar(
              'Wrong!', 'The passport pdf field must be a file of type: pdf.',
              backgroundColor: AppColor.kRedColor);
        }
      } else {
        _isPassport = false;
        update();
      }
    } else {
      _isPassport = false;
      update();
    }
  }
}
