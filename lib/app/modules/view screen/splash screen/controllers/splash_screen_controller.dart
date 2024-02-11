import 'package:amin_agent/app/api%20services/auth/test_api.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:amin_agent/app/modules/widgets/server_down_ui_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../app info/app_info.dart';
import '../../../../routes/app_pages.dart';
import '../../../connectivity/controller/internet_connectivity.dart';

import 'package:flutter/material.dart';

class SplashScreenController extends GetxController {

  Map _data = {};
  Map get data =>_data;
  Future userAlreadyLogged() async {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null || NetworkController.connectionType != 0) {
        Get.offAllNamed(RouteName.bottomNav, arguments: data);
      } else {
        Get.offAllNamed(RouteName.loginScreen);
      }
    });
  }
// Retrieve data from Firestore
  Future<void> checkForUpdates() async {
    FirebaseFirestore.instance
        .collection('mpo_flutter')
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        _data = doc.data();
        userAlreadyLogged();
      }
    });
  }

  @override
  void onInit() {
    checkForUpdates();
    super.onInit();
  }
}