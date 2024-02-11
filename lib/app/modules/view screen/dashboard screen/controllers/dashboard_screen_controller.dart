import 'package:amin_agent/app/api%20services/push%20notification/notification_unread_count.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../../../api services/auth/log_out.dart';
import '../../../../api services/dashboard/dashboard_data.dart';
import '../../../../data/utils/method.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../Fcm Notification/controller/fcm_notification_controller.dart';

class DashboardScreenController extends GetxController {
  final isUpdateAvailable = Get.arguments;
  bool _isProgress = false;

  bool get isProgress => _isProgress;

  Map<String, dynamic> _currentProgressList = {};
  Map<String, dynamic> _progressList = {};
  Map<String, dynamic> _unreadNotification = {};
  List _pieChart = [];

  Map<String, dynamic> get currentProgressList => _currentProgressList;

  Map<String, dynamic> get unreadNotification => _unreadNotification;

  Map<String, dynamic> get progressList => _progressList;

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
    print(isUpdateAvailable);
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await dashboardDataRequest(token);
      if (response['success'] == true) {
        _currentProgressList.clear();
        _currentProgressList = response['data'];
        _progressList = response['data']['current_target'];
        _pieChart = response['data']['pie_chart'];
        await StoreData.saveCurrentTargetId(
            response['data']['current_target']['target_id']);
        //When dashboard data calling after calling this method because userId not set before called this mehtod and showing empty list
        Get.put(ScheduleScreenController()).initializeMethod(joinedDates);
        Get.put(ProfileScreenController())
            .completedSchedulePicture(joinedDates);
        Get.put(FcmMessagingController()).getFcmTokenAndStoreDB();
        for (var agent in response['data']['pie_chart']) {
          convertedDataMap[agent['agent_name']] =
              agent['sell_amount'].toDouble();
        }
      }
    }
  }

  Future notificationUnreadCount() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await notificationUnreadCountRequest(token);
      if (response['success'] == true) {
        _unreadNotification = response['data'];
        update();
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

  void progress(v) {
    _isProgress = v;
    update();
  }

  Future<void> initializeMethod() async {
    progress(true);
    try {
      await Future.wait([
        dashboardData(),
        notificationUnreadCount(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      progress(false);
    }
  }

  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}