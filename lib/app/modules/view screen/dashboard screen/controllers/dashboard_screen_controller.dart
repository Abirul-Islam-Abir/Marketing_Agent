import 'package:amin_agent/app/api%20services/doctor/doctor_onboard.dart';
import 'package:amin_agent/app/data/const/export.dart';
import '../../../../api services/auth/log_out.dart';
import '../../../../api services/dashboard/dashboard_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../target agents  screen/controllers/targets_agents _screen_controller.dart';

class DashboardScreenController extends GetxController {
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  Map<String, dynamic> _currentProgressList = {};

  Map<String, dynamic> get currentProgressList => _currentProgressList;
  String? userId;
  String? currentTargetId;
  Future<void> logout() async {
    box.erase();
    Get.offAllNamed(RouteName.loginScreen);
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await logOutRequest(token);
      if (response['success'] == true) {
        box.erase();
        Get.offAllNamed(RouteName.loginScreen);
      }
    }
  }


  Future<void> dashboardData() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await dashboardDataRequest(token);
      if (response['success'] == true) {
        _currentProgressList.clear();
        _currentProgressList = response['data'];
        print(response);
        await StoreData.saveCurrentTargetId(
            response['data']['current_target']['target_id']);
       final id = await box.read(UserDataKey.userIdKey);
       userId = id.toString();
        final  targetId = await box.read(UserDataKey.currentTargetIdKey);
        currentTargetId  = targetId.toString();
        Get.put(ScheduleScreenController()).initializeMethod();
      }
    }
  }

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        dashboardData(),
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