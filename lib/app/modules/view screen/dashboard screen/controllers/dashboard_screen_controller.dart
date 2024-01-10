import 'package:get/get.dart';

import '../../../../api services/auth/log_out.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../../routes/app_pages.dart';

class DashboardScreenController extends GetxController {
  String text = 'Total commission';
 Future logout()async{
   final response = await logOutRequest();
   if (response['success'] == true) {
     box.remove(UserDataKey.tokenKey);
     box.remove(UserDataKey.idKey);
     Get.offAllNamed(RouteName.loginScreen);
   }else{
     Get.snackbar('Error', response['error']['message']);
   }
 }
 Future getUserData()async{
   await setUserTokenAndId();
 }
 @override
  void onInit() {
 getUserData();
     super.onInit();
  }
}
