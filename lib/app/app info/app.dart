import 'package:amin_agent/app/data/state%20holder%20binder/state_holder_binder.dart';
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
            initialRoute: RouteName.dashboardScreen,
            getPages: AppPages.routes,
            initialBinding: StateHolderBinding(),
            theme: mainTheme(),
          );
        },
        maxTabletWidth: 900);
  }
}


