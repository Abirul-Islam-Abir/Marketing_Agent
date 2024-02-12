
import 'package:amin_agent/app/api%20services/shedules/all_shedules.dart';
import 'package:amin_agent/app/api%20services/shedules/complete_schedule.dart';
import 'package:amin_agent/app/data/const/export.dart';

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
        print(response['data']);
      }
    }
  }
void progress(v){
    _isProgress=v;
    update();
}
  // Handle the process of selecting an image
  //Complete Schedule here
  Future<void> getImage(
      {imageSource, completionLang, completionLat, uid, index}) async {
    Get.back(); // Close any existing screen
     allScheduleList.removeAt(index);
    progress(true);
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
             progress(false);
            Get.snackbar('Failed!', 'Unsuccessfully operation ');
          }
        }
      } else {
        progress(false);
      }
    } catch (e) {
      throw Exception('$e');
    } finally {
      progress(false);
    }
  }

  Future<void> initializeMethod(date) async {
    progress(true);
    try {
      await Future.wait([
        allScheduleData(date),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      progress(false);
    }
  }
}