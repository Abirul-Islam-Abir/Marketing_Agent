import 'package:amin_agent/app/api%20services/auth/test_api.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:amin_agent/app/modules/widgets/server_down_ui_screen.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  Future userAlreadyLogged() async {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        Get.offAllNamed(RouteName.bottomNav);
      } else {
        Get.offAllNamed(RouteName.loginScreen);
      }
    });
  }

  Future checkServerWorkingOrDown() async {
    final response = await testApiRequest();
    if (response != null) {
      await userAlreadyLogged();
    }else{
      Get.offAll(() => const ServerDownScreen());
    }

  }

  @override
  void onInit() {
    userAlreadyLogged();
    super.onInit();
  }
}
