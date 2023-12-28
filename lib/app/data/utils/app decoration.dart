import 'package:flutter/cupertino.dart';

import '../../theme/app_color.dart';

class AppDecoration{
  static  BoxDecoration buildBottomDecoration() {
    return BoxDecoration(
      color: AppColor.kWhiteColor,
      boxShadow: [
        BoxShadow(
          color: AppColor.kBlackColor.withOpacity(0.3), // Shadow color
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // Changes the position of the shadow
        ),
      ],
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    );
  }

  AppDecoration._();
}