import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image/image.dart' as image;
import 'package:path_provider/path_provider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationService {
  initializeApp() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory? directory = await getExternalStorageDirectory();
    final String filePath = '${directory!.path}/$fileName.png';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future showNotify({
    required RemoteMessage message,
    payload,
  }) async {
    final String largeIconPath = await _downloadAndSaveFile(
      message.notification!.android!.smallIcon ?? ' @mipmap/ic_launcher',
      'largeIcon',
    );
    /* final String bigPicturePath = await _downloadAndSaveFile(
      message.notification!.android!.imageUrl??'@mipmap/ic_launcher',
      'bigPicture',
    );*/

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'MPO-Marketing',
          'your_channel_name',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          largeIcon: FilePathAndroidBitmap(largeIconPath),
          channelDescription: 'big text channel description',
          /*styleInformation: BigPictureStyleInformation(
            FilePathAndroidBitmap(bigPicturePath),
          ),*/
        ),
      ),
      payload: payload,
    );
  }
}