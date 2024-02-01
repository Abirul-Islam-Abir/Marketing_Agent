import 'package:amin_agent/app/api%20services/push%20notification/store_or_update_fcm_token.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../../data/utils/store_data.dart';
import '../local notification/local_notification.dart';

class FcmMessagingController extends GetxController {
//google cloud console enabled
//https://console.cloud.google.com/apis/api/googlecloudmessaging.googleapis.com/quotas?project=flutter-ecommerce-ui-1-150d7
//http://fcm/googleapis.com/fcm/send
  var deviceToken =
      'frMYqfp8SpuAcuySAabTgP:APA91bFIjMq0kZQg4oIK-1Of0vbAqB4iIf4K4As7srPs3YJML0Kyfcz7a9CfS_XkmIorCTIlA9Pp4fIohqWy0_5amNchcs7t1t00dVZYy4nPZXCIpXR4Y1j_oJ66wbw0mLKehMKgiR9F';
  var serverKey =
      'AAAAg55L9D8:APA91bEJzSxsFZ0cejUcpqoLGcOW1hKBPjqcE7a9VzUfGqdkQBZKbwyGyMug0p8eNdnKf30EW_WQI1DWMtpLcdPbSdEUGAO2CmT8zj2h9icM2Af7P5ovDus20-03TF-KtuqLUMNVtTeC';

  fcmPermissionRequest() async {
    //!Request here for fcm
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('fcmPermissionRequest $settings');
  }

  getInitialMessage() async {
//!Get initial message
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((message) => print('getInitialMessage $message'));
  }

  onForegroundApp() async {
    //!Foreground message in fcm
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationService().showNotification(
            title: '${message.notification!.title}',
            body: '${message.notification!.body}',
            payload: 'Its an another payload');
        print('onForegroundApp: ${message.notification!.title}');
        print('onForegroundApp: ${message.notification!.body}');
      }
    });
  }

  onOpenedApp() async {
    //!onAppOpend messager from fcm
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationService().showNotification(
            title: '${message.notification!.title}',
            body: '${message.notification!.body}',
            payload: 'Its an another payload');
        print('onOpenedApp: ${message.notification!.title}');
        print('onOpenedApp: ${message.notification!.body}');
      }
    });
  }

  Future<void> getFcmTokenAndStoreDB() async {
    final token = await box.read(UserDataKey.tokenKey);

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      // TODO: If necessary send token to application server.

      if (token != null && fcmToken.isNotEmpty) {
        final response = await storeOrUpdateFcmTokenRequest(
            fcmToken: fcmToken, token: token);
        print(response);
      }
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
      print('Refreshed token:$fcmToken');
    }).onError((err) {});
    //!Here have app tokens
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print('here have device tokens:$fcmToken');
    if (token != null && fcmToken != null) {
      final response =
          await storeOrUpdateFcmTokenRequest(fcmToken: fcmToken, token: token);
      print(response);
    }
  }

  @override
  void onInit() {
    fcmPermissionRequest();
    getInitialMessage();
    onForegroundApp();
    onOpenedApp();
    getFcmTokenAndStoreDB();
    super.onInit();
  }
}