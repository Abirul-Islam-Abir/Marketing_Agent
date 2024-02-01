import 'package:device_preview/device_preview.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/data/const/export.dart';
import 'app/modules/Fcm Notification/controller/fcm_notification_controller.dart';
import 'app/modules/Fcm Notification/local notification/local_notification.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await initializeApp();
}

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationService().initializeApp();
  Get.put(FcmMessagingController());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MPO(), // Wrap your app
    ),
    //const AminAgent(),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}