import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/app/functions/responsive_font_size.dart';

import '../../core/util/app_color.dart';


Future<bool?> toastMsg(String msg,Color backgroundColor){
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: AppColor.white,
      fontSize: getResponsiveFontSize(16),

  );
}

