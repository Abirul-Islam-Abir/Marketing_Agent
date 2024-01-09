import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {

  Future checkIfLogged()async{
   await getUserToken();
 Future.delayed(Duration(seconds: 4)).then((value) {
   if(StoreData.token.isNotEmpty){
     Get.offAllNamed(RouteName.bottomNav);
   }else{
     Get.offAllNamed(RouteName.loginScreen);
   }
 });
  }

  @override
  void onInit() {
    checkIfLogged();
     super.onInit();
  }
}
