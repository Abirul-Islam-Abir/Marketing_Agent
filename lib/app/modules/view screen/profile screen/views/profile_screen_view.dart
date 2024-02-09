import 'package:amin_agent/app/data/utils/method.dart';
import 'package:amin_agent/app/modules/view%20screen/profile%20details%20screen/view/profile_details_screen.dart';
import 'package:amin_agent/app/modules/widgets/image_view_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/const/export.dart';

class ProfileScreenView extends StatelessWidget {
  ProfileScreenView({super.key});

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
                                builder: (controller) => AvatarUpload(
                                  avatarTap: () {
                                    Get.to(() => ImageViewScreen(
                                        img: controller
                                            .userProfileList['avatar']));
                                  },
                                  selectedImagePath:
                                      _controller.selectedImagePath,
                                  img: controller.userProfileList['avatar'],
                                  onTap: () {
                                    addPhotoDialog(
                                      cameraTap: () {
                                        _controller.getImage(ImageSource.camera);
                                      },
                                      galleryTap: () {
                                        _controller.getImage(ImageSource.gallery);
                                      },
                                    );
                                  },
                                ),
                              ),
                              GetBuilder<ProfileScreenController>(
                                  builder: (_) => UserName('${data['name']}')),
                              GetBuilder<ProfileScreenController>(
                                builder: (_) =>
                                    SalesExecutiveText('${data['designation']}'),
                              ),
                              const SizedBox(height: 10),
                              GetBuilder<ProfileScreenController>(
                                  builder: (controller) {
                                final data = controller.completedTargetVisitList;
                                return VisitAndTargetCard(
                                  visit: AppString.visitDone,
                                  visitCount: '${data['visits'] ?? ''}',
                                  target: AppString.targetComplete,
                                  targetCount: '${data['targets'] ?? ''}',
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
                        child: CircleAvatar(
                          backgroundColor: AppColor.kWhiteColor,
                          child: IconButton(
                            onPressed: () {
                              Get.to(() => ProfileDetailsScreen());
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
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          )),
    );
  }
}