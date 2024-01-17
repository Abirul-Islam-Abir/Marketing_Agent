import 'package:amin_agent/app/data/const/export.dart';
import 'app_bar_theme.dart';
import 'elevated_button_theme.dart';

ThemeData mainTheme() => ThemeData(

      scaffoldBackgroundColor: AppColor.kScaffoldBlue,
      brightness: Brightness.light,
      fontFamily: 'Rubik',
      iconTheme: const IconThemeData(color: AppColor.kWhiteColor),

      primaryColor: AppColor.kWhiteColor,
      textButtonTheme: const TextButtonThemeData(

          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(AppColor.kWhiteColor))),
      appBarTheme: globalAppBarTheme(),
      elevatedButtonTheme: globalElevatedButtonStyle(),
      inputDecorationTheme: const InputDecorationTheme(),

    );
