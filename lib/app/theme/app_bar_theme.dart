import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


AppBarTheme globalAppBarTheme() => const AppBarTheme(
    systemOverlayStyle:
    SystemUiOverlayStyle(statusBarColor: AppColor.kBlackColor),
backgroundColor: AppColor.kTransparentColor,
    centerTitle: true,
    elevation: 0);