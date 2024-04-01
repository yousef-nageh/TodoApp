import 'package:flutter/material.dart';
import 'package:todo_app/core/config/theme/color_scheme_theme.dart';
import 'package:todo_app/core/config/theme/input_decoration_theme.dart';
import 'package:todo_app/core/util/app_color.dart';
import 'package:todo_app/core/util/app_style.dart';
import 'package:todo_app/features/home/presentation/manager/theme_cubit/theme_cubit.dart';

abstract class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData.light().copyWith(
      colorScheme:ColorSchemeTheme.lightColorSchemeTheme,

      scaffoldBackgroundColor: AppColor.white,
      textTheme: ThemeData.light()
          .textTheme
          .apply(fontFamily: ThemeCubit.getInstance(context).getFontFamily())
          .copyWith(
              bodyLarge: AppStyle.textStyle18.copyWith(color: AppColor.black)),
      inputDecorationTheme:AppInputDecoration.inputDecorationLightTheme,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: AppStyle.textStyle15,
      )),
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.transparent,
        color: AppColor.white,
        elevation: 3,
        clipBehavior: Clip.antiAlias,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColor.white,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColor.white,
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData.dark().copyWith(
      colorScheme: ColorSchemeTheme.darkColorSchemeTheme,

      scaffoldBackgroundColor: AppColor.darkMode,
      textTheme: ThemeData.dark().textTheme.apply(fontFamily:  ThemeCubit.getInstance(context).getFontFamily()).copyWith(
          bodyLarge: AppStyle.textStyle18.copyWith(color: AppColor.whiteOpacity)),
      inputDecorationTheme: AppInputDecoration.inputDecorationDarkTheme,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: AppStyle.textStyle15,
      )),
      cardTheme:  CardTheme(
        surfaceTintColor: Colors.transparent,
        color: AppColor.darkMode.withOpacity(0.93),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColor.white,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColor.darkMode,
      ),

  );
}
