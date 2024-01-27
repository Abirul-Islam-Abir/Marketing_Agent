import 'package:amin_agent/app/modules/view%20screen/profile%20details%20screen/view/profile_details_screen.dart';
import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/avatar_loading_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/const/export.dart';
import '../../../../data/dummy data/profile_picture_dummy_data.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  ProfileScreenView({Key? key}) : super(key: key);
  final _controller = Get.put(ProfileScreenController());
  final _bottomNavController = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    final data = _controller.userProfileList;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _bottomNavController.selectIndex(0);
      },
      child: Scaffold(
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
                            builder: (_) => UserName('${data['name']}')),
                        GetBuilder<ProfileScreenController>(
                          builder: (_) =>
                              SalesExecutiveText('${data['designation']}'),
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
                        Get.to(() => ProfileDetailsScreen());
                        //  Get.to(() => UserProfileEditScreen());
                      },
                      icon: const Icon(
                        Icons.account_circle,
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
