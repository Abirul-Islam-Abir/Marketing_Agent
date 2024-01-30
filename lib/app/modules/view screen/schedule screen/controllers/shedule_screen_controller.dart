import 'dart:io';

import 'package:amin_agent/app/api%20services/shedules/all_shedules.dart';
import 'package:amin_agent/app/api%20services/shedules/complete_schedule.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../../../../data/utils/user_data_key.dart';

class ScheduleScreenController extends GetxController {
  bool _isProgress = true;

  bool get isProgress => _isProgress;
  List _allScheduleList = [];
  List get allScheduleList => _allScheduleList;
  bool isActiveBackButton = Get.arguments ?? false;
  Future<void> allScheduleData() async {
    final token = await box.read(UserDataKey.tokenKey);
    print(token);
    final targetId = await box.read(UserDataKey.currentTargetIdKey);
    if (token != null && targetId != null) {
      final response = await allSheduleDataRequest(token: token, id: targetId);
      if (response['success'] == true) {
        _allScheduleList = response['data'];
      }
    }
  }

  // Handle the process of selecting an image
  //Complete Schedule here
  Future<void> getImage(
      {imageSource, completionLang, completionLat, uid, index}) async {
    Get.back(); // Close any existing screen
    _isProgress = true;
    allScheduleList.removeAt(index);
    update();
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        final token = await box.read(UserDataKey.tokenKey);
        final targetId = await box.read(UserDataKey.currentTargetIdKey);
        print(targetId);
        if (token != null && targetId != null) {
          // Compress and upload the selected image
          final compressedImage = await compressImage(pickedFile.path);
          /*** Send the complete data ***/
          final response = await completeScheduleRequest(
              id: targetId,
              token: token,
              completionLang: completionLang,
              completionLat: completionLat,
              path: compressedImage.path,
              uid: uid);
          print(response);
          if (response['success'] = true) {
            completedLocationTaskDialog();
            Get.find<DashboardScreenController>().initializeMethod();
          } else {
            _isProgress = false;
            update();
            Get.snackbar('Failed!', 'Unsuccessfully operation ');
          }
        }
      } else {
        _isProgress = false;
        update();
      }
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }

  // Compress the selected image
  Future<PickedFile> compressImage(String imagePath) async {
    final File imageFile = File(imagePath);
    final img.Image? originalImage =
        img.decodeImage(imageFile.readAsBytesSync());

    // Resize and encode the image
    final img.Image compressedImage = img.copyResize(originalImage!,
        width: 800, height: 600, interpolation: img.Interpolation.linear);

    final Uint8List compressedBytes =
        img.encodeJpg(compressedImage, quality: 85);

    // Save the compressed image to a new file
    final String compressedImagePath =
        "${imageFile.parent.path}/compressed_${imageFile.uri.pathSegments.last}";
    await File(compressedImagePath).writeAsBytes(compressedBytes);

    return PickedFile(compressedImagePath);
  }

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allScheduleData(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }
  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}