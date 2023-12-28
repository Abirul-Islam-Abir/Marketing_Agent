import 'package:amin_agent/app/data/state%20holder%20binder/state_holder_binder.dart';
import 'package:amin_agent/app/modules/widgets/primary_button.dart';
import 'package:amin_agent/app/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../routes/app_pages.dart';
import 'app_info.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AminAgent extends StatelessWidget {
  const AminAgent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            darkTheme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            title: AppInfo.appName,
            initialRoute: RouteName.bottomNav,
            getPages: AppPages.routes,
            initialBinding: StateHolderBinding(),
            theme: mainTheme(),
          );
        },
        maxTabletWidth: 900);
  }
}

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PrimaryButton(
            text: 'loginScreen',
            onTap: () {
              Get.toNamed(RouteName.loginScreen);
            },
          ),
          PrimaryButton(
            text: 'mapScreen',
            onTap: () {
              Get.toNamed(RouteName.bottomNav);
            },
          ),
          PrimaryButton(
            text: 'profileScreen',
            onTap: () {
              Get.toNamed(RouteName.profileScreen);
            },
          ),
          PrimaryButton(
            text: 'scheduleScreen',
            onTap: () {
              Get.toNamed(RouteName.scheduleScreen);
            },
          ),
          PrimaryButton(
            text: 'notificationScreen',
            onTap: () {
              Get.toNamed(RouteName.notificationScreen);
            },
          ),
          PrimaryButton(
            text: 'greetingsScreen',
            onTap: () {
              Get.toNamed(RouteName.greetingsScreen);
            },
          ),
        ],
      ),
    );
  }
}
