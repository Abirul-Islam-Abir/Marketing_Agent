import 'package:amin_agent/app/data/const/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({Key? key}) : super(key: key);
  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    controller.userAlreadyLogged;
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Center(
        child: SizedBox(
            child: Column(
              children: [
                Spacer(),
                SvgPicture.asset('assets/images/img_linkedin.svg'),
                SvgPicture.asset('assets/images/MPO TRACKING.svg'),
               Spacer(),
                Text(AppInfo.appName,style: TextStyle(color: AppColor.kGreyColor),),
                InkWell(
                    onTap: (){
                      print('Hellow');
                    },
                    child: Text('Version:'+AppInfo.appVersion,style: TextStyle(color: AppColor.kGreyColor),)),
              ],
            )),
      ),
    );
  }
}
