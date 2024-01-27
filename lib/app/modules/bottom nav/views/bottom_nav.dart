import '../../../data/const/export.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
