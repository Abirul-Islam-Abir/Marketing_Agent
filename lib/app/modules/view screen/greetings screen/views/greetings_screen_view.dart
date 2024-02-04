import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';
import '../components/animate_congratulate.dart';

class GreetingsScreenView extends StatelessWidget {
  const GreetingsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(AppImages.trophy),
                  Image.asset(AppImages.bottomTrophy),
                  CompletedTargetText(AppString.completedTarget),
                  SizedBox(height: 10.h),
                  ContinueButton(
                      text: AppString.complete,
                      onTap: () {
                        Get.offAllNamed(RouteName.bottomNav);
                      })
                ],
              ),
            ),
          ),
          const AnimateCongratulate()
        ],
      ),
    );
  }
}