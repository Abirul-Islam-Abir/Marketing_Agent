import 'dart:io';

import 'package:get/get.dart';

import '../../../../api services/auth/update_nid.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
import 'package:file_picker/file_picker.dart';

class ProfileDetailsScreenController extends GetxController {
  /*
  * Pick a pdf file and upload
  * call method after upload method in the code when file is already uploaded
  * */
  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final response =
            await uploadNIDFileRequest(filePath: file, token: token);
        if (response['success'] == true) {
          Get.snackbar('Joss!', response['message']);
        }
      }
    } else {
      // User canceled the picker
    }
  }
}
