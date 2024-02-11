
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class ProfileScreenView extends StatelessWidget {
  ProfileScreenView({super.key});

  final _controller = Get.put(ProfileScreenController());
  final _bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _bottomNavController.selectIndex(0);
      },
      child: Scaffold(
        backgroundColor: AppColor.kWhiteColor,
        body: RefreshIndicator(
          onRefresh: () async {
            _controller.initializeMethod();
          },
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const ProfileBackgroundView(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 10.h),
                            ProfileText(AppString.profile),
                            const SizedBox(height: 10),
                            GetBuilder<ProfileScreenController>(
                              builder: (controller) {
                                final data = controller.userProfileList;
                                final avatar = data['avatar'];
                                return AvatarUpload(
                                  avatarTap: () {
                                    Get.to(() => ImageViewScreen(img: avatar));
                                  },
                                  selectedImagePath:
                                      _controller.selectedImagePath,
                                  img: avatar,
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
                                );
                              },
                            ),
                            GetBuilder<ProfileScreenController>(builder: (_) {
                              final data = _controller.userProfileList;
                              final name = '${data['name'] ?? ''}';
                              return UserName(name);
                            }),
                            GetBuilder<ProfileScreenController>(
                              builder: (_) {
                                final data = _controller.userProfileList;
                                final destination =
                                    '${data['designation'] ?? ''}';
                                return SalesExecutiveText(destination);
                              },
                            ),
                            const SizedBox(height: 10),
                            GetBuilder<ProfileScreenController>(
                                builder: (controller) {
                              final data = controller.completedTargetVisitList;
                              final visit = '${data['visits'] ?? ''}';
                              final target = '${data['targets'] ?? ''}';
                              return VisitAndTargetCard(
                                visit: AppString.visitDone,
                                visitCount: visit,
                                target: AppString.targetComplete,
                                targetCount: target,
                              );
                            }),
                          ],
                        ),
                        FilterButtons(
                          onTap: () {
                            Get.dialog(FilterScreenView(
                              onTap: () {
                                Get.back();
                                _controller.completedSchedulePicture(
                                    joinedSelectedDates);
                              },
                            ));
                          },
                        ),
                        ProfilePictureGridBuilder(
                            list: _controller.completedSchedulePictureList),
                      ],
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: CircleButton(onTap: () {
                        Get.to(() => ProfileDetailsScreen());
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }
}