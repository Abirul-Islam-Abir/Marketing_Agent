 import 'package:amin_agent/app/modules/connectivity/controller/internet_connectivity.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
 import '../data/const/export.dart';

class MPO extends StatelessWidget {
  const MPO({super.key});

  @override
  Widget build(BuildContext context) {

    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          Get.put(NetworkController());
          return GetMaterialApp(
            themeMode: ThemeMode.light,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            darkTheme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            title: AppInfo.appName,
             initialRoute: RouteName.initial,
            getPages: AppPages.routes,
            initialBinding: StateHolderBinding(),
            theme: mainTheme(),

          );
        },
        maxTabletWidth: 900);
  }
}

