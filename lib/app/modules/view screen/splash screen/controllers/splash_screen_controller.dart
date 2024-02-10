import 'package:amin_agent/app/api%20services/auth/test_api.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:amin_agent/app/modules/widgets/server_down_ui_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../app info/app_info.dart';
import '../../../../routes/app_pages.dart';
import '../../../connectivity/controller/internet_connectivity.dart';

class SplashScreenController extends GetxController {
  Future userAlreadyLogged() async {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null || NetworkController.connectionType != 0) {
        Get.offAllNamed(RouteName.bottomNav);
      } else {
        Get.offAllNamed(RouteName.loginScreen);
      }
    });
  }

// Retrieve data from Firestore
  void getData() {
    FirebaseFirestore.instance
        .collection('mpo_flutter')
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc.data()['appVersion'] == AppInfo.appVersion) {
          print('latest version');
          userAlreadyLogged();
        } else if (doc.data()['appVersion'] != AppInfo.appVersion &&
            doc.data()['useApp'] == true) {
          print('update availaabe');
          userAlreadyLogged();
        } else {
          print('update');
        }
      }
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}