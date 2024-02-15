import '../../../../api services/push notification/notification_list.dart';
import '../../../../api services/push notification/read_ notification.dart';
import '../../../../data/const/export.dart';

class NotificationScreenController extends GetxController {
  // Scroll controller for managing scroll behavior
  ScrollController scrollController = ScrollController();

  // Current page of notifications
  int currentPage = 1;

  // Variable to track if a progress operation is ongoing
  bool _isProgress = false;

  // Getter for accessing the progress status
  bool get isProgress => _isProgress;

  // List to store notification data
  List _notificationList = [];

  // Pagination data
  Map<String, dynamic> _paginationData = {};

  // Getter for accessing pagination data
  Map<String, dynamic> get paginationData => _paginationData;

  // Getter for accessing notification list
  List get notificationList => _notificationList;

  // List to store read notifications
  List _readNotificationList = [];

  // Getter for accessing read notification list
  List get readNotificationList => _readNotificationList;

  // Method to fetch notification list data
  Future<void> notificationListData(page) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await notificationListRequest(token: token, page: page);
      if (response['success'] == true) {
        // Clear pagination data and update with new data
        _paginationData.clear();
        _paginationData = response['data'];
        // Append new notification data to the existing list
        _notificationList = notificationList + response['data']['data'];
        // Trigger update to reflect changes in the UI
        update();
      }
    }
  }

  // Method to mark notifications as read
  Future<void> readNotification() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await readNotificationRequest(token: token);
      if (response['success'] == true) {
        // Update read notification list
        _readNotificationList = response['data'];
        // Refresh notification list data
        Get.find<DashboardScreenController>().notificationUnreadCount();
        // Trigger update to reflect changes in the UI
        update();
      }
    }
  }

  // Method to initialize the controller
  Future<void> initializeMethod(page) async {
    // Set progress to true indicating an operation is ongoing
    _isProgress = true;
    update();
    try {
      // Fetch notification list data
      await Future.wait([
        notificationListData(page),
      ]);
    } catch (e) {
      // Throw an exception if an error occurs during initialization
      throw Exception('$e');
    } finally {
      // Set progress to false indicating operation completion
      _isProgress = false;
      update();
    }
  }

  // Called when the controller is initialized
  @override
  void onInit() {
    // Initialize the controller with the current page
    initializeMethod(currentPage);
    // Add listener to the scroll controller to implement pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // When reaching the bottom of the list, load more data
        currentPage++;
        initializeMethod(currentPage);
      }
    });
    super.onInit();
  }
}