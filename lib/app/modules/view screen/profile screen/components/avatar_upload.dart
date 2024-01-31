import '../../../../data/const/export.dart';

class AvatarUpload extends StatelessWidget {
  const AvatarUpload({
    super.key,
    this.onTap, required this.img, required this.selectedImagePath, this.avatarTap,
  });

  final void Function()? onTap,avatarTap;
  final String img;
  final String selectedImagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
            onTap: avatarTap,
            child: UserAvatar(img,selectedImagePath:selectedImagePath )),
        Positioned(
          bottom: 30,
          right: -0,
          child: InkWell(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: AppColor.kSecondaryColor,
              radius: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: AppColor.kWhiteColor,
                  size: 25,
                ),
                onPressed: onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}