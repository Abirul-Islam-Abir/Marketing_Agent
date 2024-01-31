import '../../../data/const/export.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';

import '../../connectivity/controller/internet_connectivity.dart';

class BottomNav extends StatelessWidget {
    BottomNav({Key? key}) : super(key: key);

  final controller = Get.put(BottomNavController());

  List items = [
    BottomBarItem(iconData: Icons.dashboard),
    BottomBarItem(iconData: Icons.schedule_outlined),
    BottomBarItem(iconData: Icons.location_on_rounded),
    BottomBarItem(iconData: Icons.account_circle),
  ];

  final List<Widget> bottomBarPages = [
    DashboardScreenView(),
      ScheduleScreenView(),
      const MapScreenView(),
    ProfileScreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(NetworkController());
    return Scaffold(
      body: GetBuilder<BottomNavController>(
          builder: (_) => bottomBarPages[controller.selectedIndex]),
      extendBody: true,
      bottomNavigationBar: GetBuilder<BottomNavController>(
        builder: (_) => BottomBarBubble(color: AppColor.kPrimaryColor,
          backgroundColor: AppColor.kWhiteColor,
          selectedIndex: controller.selectedIndex,
          items: List.generate(items.length, (index) => items[index]),
          onSelect: controller.selectIndex,
        ),
      ),
    );
  }
}