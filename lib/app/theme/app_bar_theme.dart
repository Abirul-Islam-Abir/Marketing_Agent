import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

AppBarTheme globalAppBarTheme() =>   AppBarTheme(
    backgroundColor: AppColor.kTransparentColor,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColor.kWhiteColor),
    titleTextStyle: TextStyle(
        color: AppColor.kWhiteColor, fontWeight: FontWeight.bold, fontSize: 20.sp),
    elevation: 0);
