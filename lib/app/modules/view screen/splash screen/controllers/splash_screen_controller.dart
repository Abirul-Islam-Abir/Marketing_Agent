import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../profile screen/controllers/profile_screen_controller.dart';

class SplashScreenController extends GetxController {
  Future userAlreadyLogged() async {
    Future.delayed(const Duration(seconds: 0)).then((value) async {
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        final controller = Get.put(ProfileScreenController());
        if (controller.userProfileList.isNotEmpty){
          Get.offAllNamed(RouteName.bottomNav);
        }else{
          userAlreadyLogged();
        }

      } else {
        Get.offAllNamed(RouteName.loginScreen);
      }
    });
  }

  @override
  void onInit() {
    userAlreadyLogged();
    super.onInit();
  }
}
