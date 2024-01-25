import 'package:amin_agent/app/api%20services/shedules/all_shedules.dart';

import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';

class ScheduleScreenController extends GetxController {
  bool _isProgress = true;
  bool get isProgress => _isProgress;
  List _allScheduleList = [];
  List get allScheduleList =>_allScheduleList;
  Future<void> allSchedules()async{

  }

  Future<void> allTargetData() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await allSheduleDataRequest(token);
      if (response['success'] == true) {
        _allScheduleList = response['data'];
      }
    }
  }

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allTargetData(),
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
