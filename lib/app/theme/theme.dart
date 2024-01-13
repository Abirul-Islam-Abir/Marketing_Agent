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
