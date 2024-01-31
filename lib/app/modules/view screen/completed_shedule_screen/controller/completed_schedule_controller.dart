import 'package:amin_agent/app/api%20services/shedules/completed_schedule.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';

import '../../../../api services/tests/all_test.dart';
import '../../../../data/const/export.dart';

class CompleteScheduleScreenController extends GetxController {
  bool _isProgress = false;

  bool get isProgress => _isProgress;
  List _completedScheduleList = [];

  List get completedScheduleList => _completedScheduleList;
  Future<void> completedSchedule() async {
    final token = await box.read(UserDataKey.tokenKey);
    final targetId = await box.read(UserDataKey.currentTargetIdKey);
    print(targetId);
    if (token != null && targetId != null) {
      final response = await completedScheduleRequest(token:token,id: targetId);
      if (response['success'] == true) {
        _completedScheduleList.clear();
        _completedScheduleList = response['data'];
        print(response);
      }
    }
  }
  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        completedSchedule(),
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