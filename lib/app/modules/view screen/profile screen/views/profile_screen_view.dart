import 'package:amin_agent/app/data/utils/utils.dart';
import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/utils/app_images.dart';
import '../../../../data/utils/app_string.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/profile_background_view.dart';
import '../../dashboard screen/components/custom_drawer.dart';
import '../../dashboard screen/controllers/dashboard_screen_controller.dart';
import '../components/custom_floating_button.dart';
import '../components/picture_and_target_card.dart';
import '../components/profile_back_button.dart';
import '../components/profile_picture_grid_builder.dart';
import '../components/profile_target_listview_builder.dart';
import '../components/profile_text.dart';
import '../components/sales_executive_text.dart';
import '../../../widgets/user_avatar.dart';
import '../components/user_name.dart';
import '../components/visit_target_card.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  ProfileScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ProfileBackgroundView(
              image: AppImages.profileScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  ProfileText(AppString.profile),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      UserAvatar('${controller.userProfileList['avatar']}'),
                      Positioned(
                        bottom: 30,
                        right: -0,
                        child: CircleAvatar(
                          backgroundColor: AppColor.kSecondaryColor,
                          radius: 20,
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: AppColor.kWhiteColor,
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  UserName('${controller.userProfileList['name']}'),
                  SalesExecutiveText(
                      '${controller.userProfileList['designation']}'),
                  const SizedBox(height: 10),
                  VisitAndTargetCard(
                    visit: AppString.visitDone,
                    visitCount: AppString.visitCount,
                    target: AppString.targetComplete,
                    targetCount: AppString.visitCount,
                  ),
                  const SizedBox(height: 20),
                  ProfilePictureGridBuilder()
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: CircleAvatar(
              backgroundColor: AppColor.kWhiteColor,
              child: IconButton(
                onPressed: () {
                  Get.to(UserProfileEditScreen());
                },
                icon: Icon(
                  Icons.mode_edit_outline,
                  color: AppColor.kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GetBuilder<ProfileScreenController>(
        builder: (controller) => controller.selectedIndex == 0
            ? CustomFloatingButton(
                image: AppImages.uploadSvg,
                onTap: addPhotoDialog,
              )
            : const Text(''),
      ),
    );
  }
}

class UserProfileEditScreen extends StatelessWidget {
  UserProfileEditScreen({super.key});
  final profileController = Get.put(ProfileScreenController());
  final dashboardController = Get.put(DashboardScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            UserAvatar(
                '${profileController.userProfileList['avatar']}'),
            const SizedBox(height: 30),
            const DrawerUpdateCard(hint: 'Name', label: 'John Doe'),
            DrawerUpdateCard(hint: 'Name',label: 'John Doe') ,
            DrawerUpdateCard(hint: '01722734871',label: 'Phone Number') ,
            DrawerUpdateCard(hint: 'Sales Executive',label: 'Designation') ,
            DrawerUpdateCard(hint: 'Company',label: 'Amin Diagnostics') ,
            DrawerUpdateCard(hint: '124578945124',label: 'NID Number') ,
            DrawerUpdateCard(hint: 'Uttara,Dhaka',label: 'Location') ,
            SizedBox(height: 30),
            PrimaryButton(text: 'Update', onTap:  () {

            },)
          ],
        ),
      ),
    );
  }
}
