import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'app_bar_theme.dart';
import 'elevated_button_theme.dart';

ThemeData mainTheme() => ThemeData(

  brightness: Brightness.light,
      fontFamily: 'Rubik',
      scaffoldBackgroundColor: AppColor.kWhiteColor,
      appBarTheme: globalAppBarTheme(),
      elevatedButtonTheme: globalElevatedButtonStyle(),
      inputDecorationTheme: const InputDecorationTheme(

      ),
    );
