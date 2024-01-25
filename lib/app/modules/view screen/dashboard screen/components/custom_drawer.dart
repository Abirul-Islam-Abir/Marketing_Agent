import 'package:amin_agent/app/modules/view%20screen/dashboard%20screen/components/drawer_user_header.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/custom_listtile.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, required this.scaffoldKey});

  final profileController = Get.put(ProfileScreenController());
  final dashboardController = Get.put(DashboardScreenController());
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColor.kSecondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: dashboardController.logout,
                      icon: const Icon(
                        Icons.logout,
                        size: 30,
                        color: AppColor.kWhiteColor,
                      )),
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.closeDrawer();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: AppColor.kWhiteColor,
                      ))
                ],
              ),
            ),
            DrawerUserHeader(
                image: '${profileController.userProfileList['avatar']}',
                name: '${profileController.userProfileList['name']}',
                subtitle:
                    '${profileController.userProfileList['designation']}'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomListTile(
                        color: AppColor.kScaffoldBlue.withOpacity(0.9),
                        icon: Icons.dashboard,
                        name: 'Dashboard',
                        onTap: () {}),
                    CustomListTile(
                        color: AppColor.kSecondaryColor,
                        icon: Icons.departure_board,
                        name: 'Doctor onboard',
                        onTap: () =>
                            Get.toNamed(RouteName.doctorOnboardScreen)),
                    CustomListTile(
                        color: AppColor.kSecondaryColor,
                        icon: Icons.money,
                        name: 'Doctor Total sales',
                        onTap: () => Get.toNamed(RouteName.totalSalesScreen)),
                    CustomListTile(
                        color: AppColor.kSecondaryColor,
                        icon: Icons.money_sharp,
                        name: 'Total commission',
                        onTap: () =>
                            Get.toNamed(RouteName.totalCommissionScreen)),
                    CustomListTile(
                        color: AppColor.kSecondaryColor,
                        icon: Icons.pending_actions_sharp,
                        name: 'Doctor visited',
                        onTap: () =>
                            Get.toNamed(RouteName.doctorVisitedScreen)),
                    CustomListTile(
                      color: AppColor.kSecondaryColor,
                      icon: Icons.money_sharp,
                      name: 'Current Target',
                      onTap: () => Get.toNamed(RouteName.agentScreen),
                    ),
                    CustomListTile(
                      color: AppColor.kSecondaryColor,
                      icon: Icons.money_sharp,
                      name: 'All Targets',
                      onTap: () => Get.toNamed(RouteName.allTargetScreen),
                    ),
                    const CustomListTile(
                        color: AppColor.kSecondaryColor,
                        icon: Icons.settings,
                        name: 'Settings'),
                    const CustomListTile(
                        color: AppColor.kSecondaryColor,
                        icon: Icons.arrow_circle_down_sharp,
                        name: 'About'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
