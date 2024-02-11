import '../../../../data/const/export.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.kWhiteColor,
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.account_circle,
          color: AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}