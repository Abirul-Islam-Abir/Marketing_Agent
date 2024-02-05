import 'package:amin_agent/app/api%20services/doctor/target_wise_doctor.dart';
import 'package:get/get.dart';

import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class TargetWiseDoctorVisitedController extends GetxController {
  final id = Get.arguments;
  bool _isProgress = false;
  bool get isProgress => _isProgress;


  List _targetWiseDoctorVisitedList = [];
  List get targetWiseDoctorVisitedList => _targetWiseDoctorVisitedList;
  Future targetWiseDoctorVisited() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await targetWiseDoctorRequest(token:token,id: id);
      if (response['success'] == true) {
        _targetWiseDoctorVisitedList = response['data'];
       }
    }
  }

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        targetWiseDoctorVisited(),
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