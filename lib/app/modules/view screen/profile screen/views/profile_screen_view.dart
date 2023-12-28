import 'package:amin_agent/app/data/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/utils/app_images.dart';
import '../../../../data/utils/app_string.dart';
import '../../../widgets/profile_background_view.dart';
import '../components/custom_floating_button.dart';
import '../components/picture_and_target_card.dart';
import '../components/profile_back_button.dart';
import '../components/profile_picture_grid_builder.dart';
import '../components/profile_target_listview_builder.dart';
import '../components/profile_text.dart';
import '../components/sales_executive_text.dart';
import '../components/user_avatar.dart';
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
      floatingActionButton: GetBuilder<ProfileScreenController>(
        builder: (controller) => controller.selectedIndex == 0
            ? CustomFloatingButton(
                image: AppImages.uploadSvg,
                onTap: addPhotoDialog,
              )
            : const Text(''),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
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
                  UserAvatar(AppImages.userImage),
                  UserName(AppString.userName),
                  SalesExecutiveText(AppString.salesExecutive),
                  const SizedBox(height: 10),
                  VisitAndTargetCard(
                    visit: AppString.visitDone,
                    visitCount: AppString.visitCount,
                    target: AppString.targetComplete,
                    targetCount: AppString.visitCount,
                  ),
                  const SizedBox(height: 20),
                  GetBuilder<ProfileScreenController>(
                    builder: (_) => PictureAndTargetCard(
                      pictureTap: controller.decrement,
                      targetTap: controller.increment,
                      index: controller.selectedIndex,
                      picture: AppString.picture,
                      target: AppString.target,
                    ),
                  ),
                  GetBuilder<ProfileScreenController>(
                    builder: (_) => controller.selectedIndex == 0
                        ? const ProfilePictureGridBuilder()
                        : const ProfileTargetListviewBuilder(),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 30,
            right: 0,
            left: 0,
            child: ProfileBackButton(),
          ),
        ],
      ),
    );
  }
}
