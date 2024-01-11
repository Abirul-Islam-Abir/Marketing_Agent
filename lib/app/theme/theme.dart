import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'app_bar_theme.dart';
import 'elevated_button_theme.dart';

ThemeData mainTheme() => ThemeData(

      fontFamily: 'Rubik',
      appBarTheme: globalAppBarTheme(),
      elevatedButtonTheme: globalElevatedButtonStyle(),
      inputDecorationTheme: const InputDecorationTheme(
      ),
    );
