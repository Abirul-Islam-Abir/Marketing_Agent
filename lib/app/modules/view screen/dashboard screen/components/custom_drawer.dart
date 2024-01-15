import 'package:amin_agent/app/modules/view%20screen/dashboard%20screen/components/drawer_user_header.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/primary_button.dart';
import 'custom_listtile.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              DrawerUserHeader(
                  image: '${profileController.userProfileList['avatar']}',
                  name: '${profileController.userProfileList['name']}',
                  subtitle:
                      '${profileController.userProfileList['designation']}'),
              const SizedBox(height: 40),
              const Divider(height: 3, color: AppColor.kGreyColor),
              CustomListTile(
                  icon: Icons.dashboard,
                  name: 'Dashboard',
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                  }),
              CustomListTile(
                  icon: Icons.departure_board,
                  name: 'Doctor onboard',
                  onTap: () => Get.toNamed(RouteName.doctorOnboardScreen)),
              CustomListTile(
                  icon: Icons.money,
                  name: 'Doctor Total sales',
                  onTap: () => Get.toNamed(RouteName.totalSalesScreen)),
              CustomListTile(
                  icon: Icons.money_sharp,
                  name: 'Total commission',
                  onTap: () => Get.toNamed(RouteName.totalCommissionScreen)),
              CustomListTile(
                  icon: Icons.pending_actions_sharp,
                  name: 'Doctor visited',
                  onTap: () => Get.toNamed(RouteName.doctorVisitedScreen)),
              CustomListTile(
                icon: Icons.money_sharp,
                name: 'Sales targets',
                onTap: () => Get.toNamed(RouteName.salesTargetScreen),
              ),
              const CustomListTile(icon: Icons.settings, name: 'Settings'),
              const CustomListTile(
                  icon: Icons.arrow_circle_down_sharp, name: 'About'),
              PrimaryButton(text: 'Log Out', onTap: dashboardController.logout),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
