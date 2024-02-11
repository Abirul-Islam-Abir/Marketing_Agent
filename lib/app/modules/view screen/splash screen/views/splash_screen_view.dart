import 'package:amin_agent/app/data/const/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});
  final _controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    _controller.userAlreadyLogged;
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Center(
        child: SizedBox(
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset('assets/images/img_linkedin.svg'),
                SvgPicture.asset('assets/images/MPO TRACKING.svg'),
               const Spacer(),
                Text(AppInfo.appName,style: const TextStyle(color: AppColor.kGreyColor),),
                Text('Version:${AppInfo.appVersion}',style: const TextStyle(color: AppColor.kGreyColor),),
              ],
            )),
      ),
    );
  }
}