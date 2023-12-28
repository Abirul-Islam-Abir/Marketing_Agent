import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

AppBar buildPrimaryAppbar(title) {
  return AppBar(
    backgroundColor: AppColor.appBarColor,
    title: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: AppColor.kWhiteColor),
    ),
  );
}

AppBar secondaryAppbar(title,onTap) {
  return AppBar(
    backgroundColor: AppColor.appBarColor,
    leading: InkWell(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios_new_outlined,
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
