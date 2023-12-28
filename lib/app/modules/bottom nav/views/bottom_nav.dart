import 'package:amin_agent/app/modules/view%20screen/map_screen/views/map_screen_view.dart';
import 'package:amin_agent/app/modules/view%20screen/notification_screen/views/notification_screen_view.dart';
import 'package:amin_agent/app/modules/view%20screen/profile%20screen/views/profile_screen_view.dart';
 import 'package:amin_agent/app/routes/app_pages.dart';
import 'package:amin_agent/app/theme/app_color.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view screen/greetings_screen/controllers/greetings_screen_controller.dart';

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

  /// widget list
  final List<Widget> bottomBarPages = [
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
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // Changes the position of the shadow
            ),
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavItems(
                text: 'Schedule',
                icon: Icons.schedule,
                onTap: () {
                  Get.toNamed(RouteName.scheduleScreen);
                }),
            BottomNavItems(
                text: 'Profile', icon: Icons.account_circle, onTap: () {
              Get.toNamed(RouteName.profileScreen);
            }),
            BottomNavItems(
                text: 'Notification', icon: Icons.notifications, onTap: () {
              Get.toNamed(RouteName.notificationScreen);
            }),
          ],
        ),
      ),
    );
  }
}

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: AppColor.kPrimaryColor,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
/*
 ConvexAppBar(
          initialActiveIndex: selectedIndex,
          items: const [
            TabItem(icon: Icons.schedule, title: 'Schedule'),
            TabItem(icon: Icons.account_circle, title: 'Profile'),
            TabItem(icon: Icons.notifications, title: 'Notification'),
          ],
          onTap: (int i) {
            selectedIndex = i;
            setState(() {});
          }),
*/
