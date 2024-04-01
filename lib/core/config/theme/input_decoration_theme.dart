import 'package:flutter/material.dart';


import '../../util/app_color.dart';
import '../../util/app_style.dart';

abstract class   AppInputDecoration{
  static InputDecorationTheme inputDecorationLightTheme=  InputDecorationTheme(
  labelStyle: AppStyle.textStyle16,
  hintStyle: AppStyle.textStyle16,
  errorStyle: AppStyle.textStyle16,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  prefixIconColor: AppColor.grey,
  enabledBorder: AppInputDecoration.outlineInputBorder(),
  focusedBorder: AppInputDecoration.outlineInputBorder(width: 2,color: AppColor.primary),
  focusedErrorBorder: AppInputDecoration.outlineInputBorder(width: 2,color: AppColor.red),
  errorBorder: AppInputDecoration.outlineInputBorder(color: AppColor.red),
  );
  static OutlineInputBorder outlineInputBorder({double width = 1,Color color =AppColor.black})=>OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:  BorderSide(width: width,color: color),);
  static InputDecorationTheme inputDecorationDarkTheme= InputDecorationTheme(
    labelStyle: AppStyle.textStyle16.copyWith(color: AppColor.whiteOpacity),
    hintStyle: AppStyle.textStyle16,
    errorStyle: AppStyle.textStyle16,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    prefixIconColor: AppColor.grey,
    enabledBorder: AppInputDecoration.outlineInputBorder(color: AppColor.whiteOpacity),
    focusedBorder: AppInputDecoration.outlineInputBorder(width: 2,color: AppColor.primary),
    focusedErrorBorder: AppInputDecoration.outlineInputBorder(width: 2,color: AppColor.red),
    errorBorder:AppInputDecoration.outlineInputBorder(color: AppColor.red),
  );
}