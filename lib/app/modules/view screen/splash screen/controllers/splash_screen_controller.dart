import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';


class SplashScreenController extends GetxController {
  Future userAlreadyLogged()async{
   await setUserTokenAndId();
 Future.delayed(const Duration(seconds: 200)).then((value) {
   if(StoreData.token.isNotEmpty){
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
