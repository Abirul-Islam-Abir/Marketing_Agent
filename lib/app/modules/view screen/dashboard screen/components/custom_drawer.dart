import 'package:amin_agent/app/modules/view%20screen/dashboard%20screen/components/drawer_user_header.dart';
import 'package:amin_agent/app/modules/widgets/about_app_screen.dart';

import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../widgets/custom_listtile.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, required this.scaffoldKey});

  final profileController = Get.put(ProfileScreenController());
  final _controller = Get.put(DashboardScreenController());
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
                      onPressed: () {
                        scaffoldKey.currentState?.closeDrawer();
                        takePhotoDialog(context, title: 'Log Out?', yesTap: () {
                          _controller.logout();
                        }, img: 'assets/svg/logout-svgrepo-com.svg');
                      },
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
              child:
                  GetBuilder<DashboardScreenController>(builder: (controller) {
                int index = controller.selectedIndex;
                return SingleChildScrollView(
                  child: Column(children: [
                    CustomListTile(
                        selected: index,
                        index: 0,
                        name: 'Dashboard',
                        onTap: () {
                          _controller.selectItem(0);

                          if (scaffoldKey.currentState!.isDrawerOpen) {
                            scaffoldKey.currentState?.closeDrawer();
                          }
                        }),
                    CustomListTile(
                        selected: index,
                        index: 1,
                        name: 'Doctor onboard',
                        onTap: () {
                          _controller.selectItem(1);

                          Get.toNamed(RouteName.doctorOnboardScreen);
                        }),
                    CustomListTile(
                        selected: index,
                        index: 2,
                        name: 'Doctor Total sales',
                        onTap: () {
                          _controller.selectItem(2);

                          Get.toNamed(RouteName.totalSalesScreen);
                        }),
                    CustomListTile(
                        selected: index,
                        index: 3,
                        name: 'Total commission',
                        onTap: () {
                          _controller.selectItem(3);

                          Get.toNamed(RouteName.totalCommissionScreen);
                        }),
                    CustomListTile(
                        selected: index,
                        index: 4,
                        name: 'Completed Schedule',
                        onTap: () {
                          _controller.selectItem(4);
                          Get.toNamed(RouteName.completedScheduleScreen);
                        }),
                    CustomListTile(
                        selected: index,
                        index: 5,
                        name: 'Current Target',
                        onTap: () async {
                          _controller.selectItem(5);

                          final targetId =
                              await box.read(UserDataKey.currentTargetIdKey);
                          if (targetId != null) {
                            Get.toNamed(RouteName.agentScreen,
                                arguments: targetId);
                          }
                        }),
                    CustomListTile(
                        selected: index,
                        index: 6,
                        name: 'Doctor visited',
                        onTap: () {
                          _controller.selectItem(6);

                          Get.toNamed(RouteName.doctorVisitedScreen);
                        }),
                    CustomListTile(
                      selected: index,
                      index: 7,
                      name: 'All Targets',
                      onTap: () {
                        _controller.selectItem(7);
                        Get.toNamed(RouteName.allTargetScreen);
                      },
                    ),

                    CustomListTile(
                        onTap: () {
                          _controller.selectItem(8);
                          Get.to(() => const AboutScreen());
                        },
                        selected: index,
                        index: 8,
                        name: 'About')
                  ]),
                );
              }),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}