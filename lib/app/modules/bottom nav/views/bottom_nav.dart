

import '../../../data/const/export.dart';
import '../components/bottom_nav_items.dart';



class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _pageController = PageController(initialPage: 0);
  int maxCount = 3;
  final controller = Get.put(GreetingsScreenController());
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  final List<Widget> bottomBarPages = [
    const DashboardScreenView(),
    const MapScreenView(),
    ProfileScreenView(),
    NotificationScreenView()
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomBarPages[selectedIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80,
        decoration: AppDecoration.buildBottomDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavItems(
              selectedIndex: 0,
                text: 'Dashboard',
                icon: Icons.dashboard,
                onTap: () {
               //   Get.toNamed(RouteName.dashboardScreen);
                }),
            BottomNavItems(selectedIndex: 1,
                text: 'Schedule',
                icon: Icons.schedule,
                onTap: () {
                  Get.toNamed(RouteName.scheduleScreen);
                }),
            BottomNavItems(selectedIndex: 2,
                text: 'Profile', icon: Icons.account_circle, onTap: () {
              Get.toNamed(RouteName.profileScreen);
            }),
            BottomNavItems(selectedIndex: 3,
                text: 'Notification', icon: Icons.notifications, onTap: () {
              Get.toNamed(RouteName.notificationScreen);
            }),
          ],
        ),
      ),
    );
  }


}

