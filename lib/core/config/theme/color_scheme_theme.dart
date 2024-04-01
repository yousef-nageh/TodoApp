import 'package:flutter/material.dart';

import '../../util/app_color.dart';

abstract class ColorSchemeTheme {

  static ColorScheme lightColorSchemeTheme=   ColorScheme.fromSeed(seedColor: AppColor.primary).copyWith(
    primary: AppColor.primary,

    onPrimaryContainer: AppColor.white,///
    /// الي جوة الاساس
    primaryContainer: AppColor.primary,///
    /// من الاخر هو الاساس


    onPrimary: AppColor.white,///
    /// الاون الي مع السهم

    onSurface:  AppColor.black,///
    /// لون الارقام

    surfaceTint: AppColor.primary,///
    ///  ///  back ground  الاون الاول

    onSurfaceVariant: AppColor.black,///
    ///  labol testform
    surfaceVariant: AppColor.white,///
    /// الدايرة الي في النص
    outlineVariant: AppColor.black,///
    /// الفاصل
    surface: AppColor.white,///
    /// back ground الاون التاني


    tertiaryContainer: AppColor.white,///
    /// فوق شمال

  );
  static ColorScheme darkColorSchemeTheme = const ColorScheme.dark().copyWith(
      primary: AppColor.primary,


      onPrimaryContainer: AppColor.white,///
      /// الي جوة الاساس
      primaryContainer: AppColor.primary,///
      /// من الاخر هو الاساس


      onPrimary: AppColor.white,///
      /// الاون الي مع السهم

      onSurface:  AppColor.white,///
      /// لون الارقام

      surfaceTint: AppColor.white,///
      ///  ///  back ground  الاون الاول

      onSurfaceVariant: AppColor.whiteOpacity,///
      ///  labol testform
      surfaceVariant: AppColor.darkMode,///
      /// الدايرة الي في النص
      outlineVariant: AppColor.whiteOpacity,///
      /// الفاصل
      surface: AppColor.darkMode,///
      /// back ground الاون التاني


      tertiaryContainer: AppColor.darkMode,///
      ///
      /// فوق شمال
      onTertiaryContainer: AppColor.primary
  );


}