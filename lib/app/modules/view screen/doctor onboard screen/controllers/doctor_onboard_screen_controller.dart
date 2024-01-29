import 'package:get/get.dart';

import '../../../../api services/doctor/doctor_onboard.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class DoctorOnboardScreenController extends GetxController {
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  List _doctorOnboardList = [];
  List get doctorOnboardList => _doctorOnboardList;
  Future doctorOnboard() async {
    final token = await box.read(UserDataKey.tokenKey);

    if (token != null) {
      final dashboardResponse = await doctorOnboardDataRequest(token);
      if (dashboardResponse['success'] == true) {
        _doctorOnboardList = dashboardResponse['data']['onboard_doctor'];
      }
    }
  }

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        doctorOnboard(),
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
