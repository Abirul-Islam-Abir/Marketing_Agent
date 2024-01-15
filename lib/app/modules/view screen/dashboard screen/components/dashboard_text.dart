import '../../../../data/const/export.dart';
import 'package:badges/badges.dart' as badges;

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({
    super.key,
    required this.menuTap,
    required this.notificationTap,
    required this.text,
  });

  final String? text;
  final Function() menuTap, notificationTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: AppColor.kSecondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: menuTap,
            icon: const Icon(
              Icons.menu_outlined,
              color: AppColor.kWhiteColor,
            ),
          ),
          Text(
            text!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: AppColor.kWhiteColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: notificationTap,
              icon: const badges.Badge(
                badgeContent: Text('3'),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColor.kWhiteColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
