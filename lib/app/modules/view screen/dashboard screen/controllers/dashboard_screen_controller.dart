import 'package:amin_agent/app/api%20services/push%20notification/notification_unread_count.dart';
import 'package:amin_agent/app/data/const/export.dart';
import '../../../../api services/auth/log_out.dart';
import '../../../../api services/dashboard/dashboard_data.dart';
import '../../../Fcm Notification/controller/fcm_notification_controller.dart';

class DashboardScreenController extends GetxController {
  // Indicates whether an update is available
  final isUpdateAvailable = Get.arguments;

  // Variable to track if a progress operation is ongoing
  bool _isProgress = false;

  // Getter to access _isProgress
  bool get isProgress => _isProgress;

  // Holds current progress data
  Map<String, dynamic> _currentProgressList = {};

  // Holds overall progress data
  Map<String, dynamic> _progressList = {};

  // Holds unread notification data
  Map<String, dynamic> _unreadNotification = {};

  // Holds data for the pie chart
  List _pieChart = [];

  // Getters to access private variables
  Map<String, dynamic> get currentProgressList => _currentProgressList;
  Map<String, dynamic> get unreadNotification => _unreadNotification;
  Map<String, dynamic> get progressList => _progressList;
  List get pieChart => _pieChart;

  // Map to store converted data for the pie chart
  Map<String, double> convertedDataMap = {};

  // User-related identifiers
  String? userId;
  String? currentTargetId;

  // Index of the selected item
  int _selectedIndex = 0;

  // Getter for selectedIndex
  int get selectedIndex => _selectedIndex;

  // Method to update the selected index and trigger an update
  void selectItem(int index) {
    _selectedIndex = index;
    update();
  }

  // Method to fetch dashboard data
  Future<void> dashboardData() async {
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

  // Method to fetch notification unread count
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

  // Method to perform user logout
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

  // Method to update progress status
  void progress(v) {
    _isProgress = v;
    update();
  }

  // Method to initialize the controller
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

  // Called when the controller is initialized
  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}