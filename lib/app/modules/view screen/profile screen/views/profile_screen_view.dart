


import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

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
                  AvatarUpload(),
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
                  const ProfilePictureGridBuilder()
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
                icon: const Icon(
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




