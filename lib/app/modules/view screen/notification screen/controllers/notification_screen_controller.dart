import '../../../../api services/push notification/notification_list.dart';
import '../../../../api services/push notification/read_ notification.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';

class NotificationScreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  int currentPage = 1;

  bool _isProgress = false;

  bool get isProgress => _isProgress;
  List _notificationList = [];
  Map<String, dynamic> _paginationData = {};
  Map<String, dynamic> get paginationData => _paginationData;
  List get notificationList => _notificationList;
  List _readNotificationList = [];
  List get readNotificationList => _readNotificationList;
  Future<void> notificationListData(id) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await notificationListRequest(token: token, id: id);
      if (response['success'] == true) {
        _paginationData.clear();
        _paginationData = response['data'];
        _notificationList = notificationList + response['data']['data'];
        update();
      }
    }
  }

  Future<void> readNotification({id, nId}) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await readNotificationRequest(token: token, id: id);
      if (response['success'] == true) {
        _readNotificationList = response['data'];
        notificationListData(nId);
      }
    }
  }

  Future<void> initializeMethod(id) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        notificationListData(id),
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
    initializeMethod(currentPage);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
       // print(paginationData['data']['next_page_url'].toString());
        currentPage++;
        initializeMethod(currentPage);
      }
    });
    super.onInit();
  }
}