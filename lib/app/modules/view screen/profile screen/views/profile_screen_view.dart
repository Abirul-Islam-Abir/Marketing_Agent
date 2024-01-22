import 'package:amin_agent/app/modules/view%20screen/profile%20details%20screen/view/profile_details_screen.dart';
import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/avatar_loading_spinkit.dart';
 import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/const/export.dart';
import '../../../../data/dummy data/profile_picture_dummy_data.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  ProfileScreenView({Key? key}) : super(key: key);
  final _controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhiteColor,
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: ProfileBackgroundView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      ProfileText(AppString.profile),
                      const SizedBox(height: 10),
                      GetBuilder<ProfileScreenController>(
                          builder: (_) => _controller.isUploadedAvatar
                              ? const AvatarLoadingSpinKit()
                              : AvatarUpload(
                                  onTap: () {
                                    addPhotoDialog(
                                      cameraTap: () {
                                        _controller
                                            .getImage(ImageSource.camera);
                                      },
                                      galleryTap: () {
                                        _controller
                                            .getImage(ImageSource.gallery);
                                      },
                                    );
                                  },
                                )),
                      GetBuilder<ProfileScreenController>(
                          builder: (controller) => UserName(
                              '${controller.userProfileList['name']}')),
                      GetBuilder<ProfileScreenController>(
                        builder: (controller) => SalesExecutiveText(
                            '${controller.userProfileList['designation']}'),
                      ),
                      const SizedBox(height: 10),
                      VisitAndTargetCard(
                        visit: AppString.visitDone,
                        visitCount: AppString.visitCount,
                        target: AppString.targetComplete,
                        targetCount: AppString.visitCount,
                      ),
                      ProfilePictureGridBuilder(
                        list: pictureDummyData,
                      )
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
                      Get.to(() => UserProfileEditScreen());
                    },
                    icon: const Icon(
                      Icons.mode_edit_outline,
                      color: AppColor.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 80,
                  right: 20,
                  child: CustomFloatingButton(
                    image: AppImages.filterSvg,
                    onTap: () {
                      Get.to(() => ProfileDetailsScreen());
                    },
                  )),
            ],
          ),
        ));
  }
}


