import '../../../../data/const/export.dart';

class AvatarUpload extends StatelessWidget {
  AvatarUpload({
    super.key, this.onTap,
  });

  final   controller = Get.put(ProfileScreenController());
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserAvatar('${controller.userProfileList['avatar']}'),
        Positioned(
          bottom: 30,
          right: -0,
          child: InkWell(
            onTap: onTap,
            child: const CircleAvatar(
              backgroundColor: AppColor.kSecondaryColor,
              radius: 20,
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: AppColor.kWhiteColor,
                  size: 25,
                ),
                onPressed: addPhotoDialog,
              ),
            ),
          ),
        ),
      ],
    );
  }
}