import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';


class SplashScreenController extends GetxController {
  Future userAlreadyLogged()async{
  Future.delayed(const Duration(seconds: 2)).then((value) async {
   final token = await box.read(UserDataKey.tokenKey);
   if(token!=null){
     Get.offAllNamed(RouteName.bottomNav);
   }else{
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
