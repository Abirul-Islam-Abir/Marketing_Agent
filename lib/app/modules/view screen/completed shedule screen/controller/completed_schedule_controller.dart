import 'package:amin_agent/app/api%20services/shedules/completed_schedule.dart';
import 'package:amin_agent/app/data/utils/method.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';

import '../../../../data/const/export.dart';

class CompleteScheduleScreenController extends GetxController {
  bool _isProgress = false;

  bool get isProgress => _isProgress;
  List _completedScheduleList = [];

  List get completedScheduleList => _completedScheduleList;
  Future<void> completedSchedule(date) async {
    final token = await box.read(UserDataKey.tokenKey);
    final targetId = await box.read(UserDataKey.currentTargetIdKey);
    if (token != null && targetId != null) {
      final response = await completedScheduleRequest(token:token,id: targetId,date: date);
      if (response['success'] == true) {
        _completedScheduleList = response['data'];
      }
    }
  }
  void     progress(v){
    _isProgress = v;
    update();
  }
  Future<void> initializeMethod(date) async {
    progress(true);
    try {
      await Future.wait([
        completedSchedule(date),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      progress(false);
    }
  }


  @override
  void onInit() {
    initializeMethod(joinedDates);
    super.onInit();
  }
}