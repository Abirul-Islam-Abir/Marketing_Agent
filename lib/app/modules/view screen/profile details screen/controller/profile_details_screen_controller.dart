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
  Future uploadNidFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final response =
            await uploadNIDFileRequest(filePath: file, token: token);
        if (response['success'] == true) {
          await Get.find<ProfileScreenController>().userProfile();
          Get.snackbar('Good Job!', response['message']);
        }
      }
    } else {
      // User canceled the picker
    }
  }

  Future uploadPassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final response =
            await updatePassportRequest(filePath: file, token: token);
        if (response['success'] == true) {
          await Get.find<ProfileScreenController>().userProfile();
          Get.snackbar('Good Job!', response['message']);
        }
      }
    } else {
      // User canceled the picker
    }
  }
}
