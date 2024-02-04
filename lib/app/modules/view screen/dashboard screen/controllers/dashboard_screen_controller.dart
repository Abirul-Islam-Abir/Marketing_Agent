import 'package:amin_agent/app/api%20services/push%20notification/notification_list.dart';
import 'package:amin_agent/app/data/const/export.dart';
import '../../../../api services/auth/log_out.dart';
import '../../../../api services/dashboard/dashboard_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../Fcm Notification/controller/fcm_notification_controller.dart';

class DashboardScreenController extends GetxController {
  bool _isProgress = false;

  bool get isProgress => _isProgress;
  Map<String, dynamic> _currentProgressList = {};
  Map _progressList = {};
  List _pieChart = [];

  Map<String, dynamic> get currentProgressList => _currentProgressList;
  Map get progressList => _progressList;
  List get pieChart => _pieChart;
  Map<String, double> convertedDataMap = {};

  String? userId;
  String? currentTargetId;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectItem(int index) {
    _selectedIndex = index;
    update();
  }

  Future<void> dashboardData() async {
    final token = await box.read(UserDataKey.tokenKey);
    print(token);
    if (token != null) {
      final response = await dashboardDataRequest(token);
      if (response['success'] == true) {
        _currentProgressList.clear();
        _currentProgressList = response['data'];
        _progressList = response['data']['current_target'];
        _pieChart = response['data']['pie_chart'];
        print(response['data']['pie_chart']);
        await StoreData.saveCurrentTargetId(
            response['data']['current_target']['target_id']);
        //When dashboard data calling after calling this method because userId not set before called this mehtod and showing empty list
        Get.put(ScheduleScreenController()).initializeMethod();
        Get.put(ProfileScreenController()).completedSchedulePicture();
        Get.put(FcmMessagingController()).getFcmTokenAndStoreDB();

        for (var agent in response['data']['pie_chart']) {
          convertedDataMap[agent['agent_name']] = agent['sell_amount'].toDouble();
        }
print(convertedDataMap);

      }
    }
  }

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