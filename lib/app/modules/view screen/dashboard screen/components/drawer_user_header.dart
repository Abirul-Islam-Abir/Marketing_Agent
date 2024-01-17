import '../../../../data/const/export.dart';

class DrawerUserHeader extends StatelessWidget {
  const DrawerUserHeader({
    super.key,
    required this.name,
    required this.subtitle,
    required this.image,
  });

  final String name, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 80, width: 80, child: UserAvatar(image)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColor.kWhiteColor),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColor.kWhiteColor),
            ),
          ],
        ),


      ],
    );
  }
}