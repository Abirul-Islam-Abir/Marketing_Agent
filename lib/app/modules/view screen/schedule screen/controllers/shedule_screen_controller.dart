import 'dart:io';

import 'package:amin_agent/app/api%20services/shedules/all_shedules.dart';
import 'package:amin_agent/app/api%20services/shedules/complete_schedule.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import '../../../../data/utils/method.dart';
import '../../../../data/utils/user_data_key.dart';

class ScheduleScreenController extends GetxController {
  bool _isProgress = true;

  bool get isProgress => _isProgress;
  List _allScheduleList = [];
  List get allScheduleList => _allScheduleList;

  Future<void> allScheduleData(date) async {
    final token = await box.read(UserDataKey.tokenKey);
    final targetId = await box.read(UserDataKey.currentTargetIdKey);
    if (token != null && targetId != null) {
      final response =
          await allScheduleDataRequest(token: token, id: targetId, date: date);
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

  Future<void> initializeMethod(date) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allScheduleData(date),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }
}