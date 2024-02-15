import 'package:amin_agent/app/api%20services/push%20notification/store_or_update_fcm_token.dart';
 import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../data/const/export.dart';
 import '../local notification/local_notification.dart';

class FcmMessagingController extends GetxController {
//google cloud console enabled
//https://console.cloud.google.com/apis/api/googlecloudmessaging.googleapis.com/quotas?project=flutter-ecommerce-ui-1-150d7
//http://fcm/googleapis.com/fcm/send
  var deviceToken =
      'frMYqfp8SpuAcuySAabTgP:APA91bFIjMq0kZQg4oIK-1Of0vbAqB4iIf4K4As7srPs3YJML0Kyfcz7a9CfS_XkmIorCTIlA9Pp4fIohqWy0_5amNchcs7t1t00dVZYy4nPZXCIpXR4Y1j_oJ66wbw0mLKehMKgiR9F';
  var serverKey =
      'AAAAg55L9D8:APA91bEJzSxsFZ0cejUcpqoLGcOW1hKBPjqcE7a9VzUfGqdkQBZKbwyGyMug0p8eNdnKf30EW_WQI1DWMtpLcdPbSdEUGAO2CmT8zj2h9icM2Af7P5ovDus20-03TF-KtuqLUMNVtTeC';

  //This time using for schedule data calling when fcm push notification after calling date wise schedule


  fcmPermissionRequest() async {
    //!Request here for fcm
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  getInitialMessage() async {
//!Get initial message
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((message) => null);
  }

  onForegroundApp() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationService().showNotify(message: message, payload: 'badge');
        Get.find<NotificationScreenController>().initializeMethod(0);
        Get.find<ScheduleScreenController>().initializeMethod(joinedDates);
      }
    });
  }

  Future<void> onOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationService().showNotify(message: message, payload: 'badge');
        Get.to(() => message.data['click_action']);
      }
    });
  }

  Future<void> getFcmTokenAndStoreDB() async {
    final token = await box.read(UserDataKey.tokenKey);
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      // TODO: If necessary send token to application server.
      if (token != null) {
        await storeOrUpdateFcmTokenRequest(fcmToken: fcmToken, token: token);
      }
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {});
    //!Here have app tokens
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    if (token != null && fcmToken != null) {
      await storeOrUpdateFcmTokenRequest(fcmToken: fcmToken, token: token);
    }
  }

  @override
  void onInit() {
    onDateChange(selectedDates);
     fcmPermissionRequest();
    getInitialMessage();
    onForegroundApp();
    onOpenedApp();
    getFcmTokenAndStoreDB();
    super.onInit();
  }
}

String image =
    'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.webp?b=1&s=170667a&w=0&k=20&c=YQ_j83pg9fB-HWOd1Qur3_kBmG_ot_hZty8pvoFkr6A=';