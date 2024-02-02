import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../api services/push notification/notification_list.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class NotificationScreenController extends GetxController {
  bool _isProgress = false;

  bool get isProgress => _isProgress;
  Map<String, dynamic> _notificationList = {};
  Map<String, dynamic> get notificationList => _notificationList;

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

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        notificationListData(0),

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