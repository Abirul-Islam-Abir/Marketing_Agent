import 'dart:io';

import 'package:amin_agent/app/api%20services/shedules/all_shedules.dart';
import 'package:amin_agent/app/api%20services/shedules/complete_schedule.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import '../../../../api services/profile/upload_avatar.dart';
import '../../../../data/const/export.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';

class ScheduleScreenController extends GetxController {
  bool _isProgress = true;

  bool get isProgress => _isProgress;
  List _allScheduleList = [];
  List get allScheduleList => _allScheduleList;
  bool isActiveBackButton = Get.arguments ?? false;
  Future<void> allScheduleData(id) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await allSheduleDataRequest(token: token, id: id);
      print(response);
      if (response['success'] == true) {
        _allScheduleList = response['data'];
      }
    }
  }

  // Handle the process of selecting an image
  //Complete Schedule here
  Future<void> getImage(
      {imageSource, completionLang, completionLat, uid}) async {
    Get.back(); // Close any existing screen
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        final token = await box.read(UserDataKey.tokenKey);
        if (token != null) {
          // Compress and upload the selected image
          final compressedImage = await compressImage(pickedFile.path);

          /*** Send the complete data ***/

          final response = await completeScheduleRequest(
              token: token,
              completionLang: completionLang,
              completionLat: completionLat,
              path: compressedImage.path,
              uid: uid);
          if (response['success'] = true) {
            completedLocationTaskDialog();
            Get.find<DashboardScreenController>().initializeMethod();
          } else {
            Get.snackbar('Failed!', 'Unsuccessfully operation ');
          }
        }
      }
    } catch (e) {
      throw Exception('$e');
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

  Future<void> initializeMethod(id) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allScheduleData(id),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }
}
