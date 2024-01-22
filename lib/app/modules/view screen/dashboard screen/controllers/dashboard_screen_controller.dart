import 'package:get/get.dart';

import '../../../../api services/auth/log_out.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../../routes/app_pages.dart';

class DashboardScreenController extends GetxController {
  String text = 'Total commission';

  Future logout() async {
    box.erase();
    Get.offAllNamed(RouteName.loginScreen);
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await logOutRequest(token);
      if (response['success'] == true) {
        box.erase();
        Get.offAllNamed(RouteName.loginScreen);
      }
    }
  }
}
