import '../../data/const/export.dart';
import 'package:badges/badges.dart' as badges;
AppBar buildPrimaryAppBar({text,badge,notificationTap}) {
  return AppBar(    backgroundColor: AppColor.appBarColor,
    title: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
        onPressed:notificationTap,
        icon: badges.Badge(
          badgeContent: Text(badge),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColor.kWhiteColor,
            size: 30,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
        width: 20,
      )
    ],
  );
}

AppBar buildSecondaryAppbar(title) {
  return AppBar(
    backgroundColor: AppColor.appBarColor,
    title: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: AppColor.kWhiteColor),
    ),
  );
}

AppBar buildNavigateAppbar(title) {
  return AppBar(
    backgroundColor: AppColor.appBarColor,
    leading:  IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColor.kWhiteColor,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: AppColor.kWhiteColor),
    ),
  );
}
AppBar buildFilterAppBar({text,filterTap}) {
  return AppBar(
    leading: const CustomBackButton(),
    title: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
        onPressed: filterTap,
        icon: const Icon(
          Icons.filter_alt_rounded,
          color: Colors.white,
        ),
      )
    ],
  );
}