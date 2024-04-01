
import 'package:flutter/material.dart';
import '../../app/functions/responsive_font_size.dart';

abstract class AppStyle{
  static  TextStyle textStyle18=TextStyle(
    fontSize: getResponsiveFontSize(18),
    fontWeight: FontWeight.normal,
  );
  static  TextStyle textStyle14=TextStyle(
      fontSize: getResponsiveFontSize(14),
      fontWeight: FontWeight.normal,

  );
  static  TextStyle textStyle15=TextStyle(
    fontSize: getResponsiveFontSize(15),
    fontWeight: FontWeight.bold,

  );
  static  TextStyle textStyle16=TextStyle(
    fontSize: getResponsiveFontSize(16),
    fontWeight: FontWeight.w500,

  );

}