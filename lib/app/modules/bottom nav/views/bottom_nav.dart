import 'package:stylish_bottom_bar/model/bar_items.dart';

import '../../../data/const/export.dart';
import '../../view screen/greetings screen/controllers/greetings_screen_controller.dart';
import '../../view screen/map screen/views/map_screen_view.dart';
import '../../view screen/notification screen/views/notification_screen_view.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

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
    DashboardScreenView(),
    ScheduleScreenView(),
    const MapScreenView(),
    ProfileScreenView(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bottomBarPages[selectedIndex],
        extendBody: true,
        bottomNavigationBar: StylishBottomBar(
          option: BubbleBarOptions(
          ),
          items: [
            BottomBarItem(
              icon: const Icon(
                Icons.dashboard,
                size: 25,
              ),
              title: const Text('Dashboard'),
              backgroundColor:AppColor.kPrimaryColor,

            ),
            BottomBarItem(
              icon: Icon(
                Icons.schedule_outlined,
                size: 25,
              ),
              title: const Text('Schedule'),
              backgroundColor: Colors.orange,
            ),
            BottomBarItem(
              icon: const Icon(
                Icons.location_on_rounded,
                size: 25,
              ),
              title: const Text('Map'),
              backgroundColor:AppColor.kPrimaryColor,
            ),
            BottomBarItem(
              icon: const Icon(
                Icons.account_circle,
                size: 25,
              ),
              title: const Text('Profile'),
              backgroundColor:AppColor.kPrimaryColor,
            ),
          ],


          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ));
  }
}
