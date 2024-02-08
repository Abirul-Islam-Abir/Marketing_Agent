import 'package:amin_agent/app/api%20services/doctor/target_wise_doctor.dart';
import 'package:amin_agent/app/data/utils/method.dart';
import 'package:get/get.dart';

import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class TargetWiseDoctorVisitedController extends GetxController {
  final id = Get.arguments;
  bool _isProgress = false;
  bool get isProgress => _isProgress;


  List _targetWiseDoctorVisitedList = [];
  List get targetWiseDoctorVisitedList => _targetWiseDoctorVisitedList;
  Future targetWiseDoctorVisited(date) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await targetWiseDoctorRequest(token:token,id: id,date: date);
      if (response['success'] == true) {
        _targetWiseDoctorVisitedList = response['data'];
       }
    }
  }

  Future<void> initializeMethod(date) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        targetWiseDoctorVisited(date),
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
    initializeMethod(joinedDates);
    super.onInit();
  }
}