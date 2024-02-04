import 'package:get/get.dart';
 import '../../../../api services/push notification/notification_list.dart';
import '../../../../api services/push notification/read_ notification.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class NotificationScreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  int currentPage = 0;

  bool _isProgress = false;

  bool get isProgress => _isProgress;
   Map<String, dynamic> _notificationList = {};
  Map<String, dynamic> get notificationList => _notificationList;
  List _readNotificationList = [];
  List get readNotificationList => _readNotificationList;
  Future<void> notificationListData(id) async {
    final token = await box.read(UserDataKey.tokenKey);
    print(token);
    if (token != null) {
      final response = await notificationListRequest(token:token,id: id);
      print(response);
      if (response['success'] == true) {
        _notificationList.clear();
        _notificationList = response['data'];
        update();
      }
    }
  }
  Future<void> readNotification({id, nId}) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null  ) {
      final response = await readNotificationRequest(token: token, id: id);
      print(response);
      if (response['success'] == true) {
         _readNotificationList = readNotificationList +  response['data'];
        notificationListData(nId);
        update();
      }
    }
  }
  Future<void> initializeMethod(id) async {
     update();
    try {
      await Future.wait([
        notificationListData(id),

      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
       update();
    }
  }

  @override
  void onInit() {
    initializeMethod(currentPage);
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        // Reached the bottom of the list, load more data
        _isProgress = true;
        update();
         currentPage++;
        initializeMethod(currentPage);
        _isProgress = false;
        update();
      }
    });
    super.onInit();
  }
}