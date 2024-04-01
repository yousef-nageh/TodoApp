
import 'package:flutter/material.dart';
import 'package:todo_app/core/config/extension.dart';

abstract class SizeConfig{
  static const mobileDevice=600;
 static double width=0,height=0;
 static void  init(BuildContext context){
    height =context.getHeight();
    if(context.getWidth()>mobileDevice){
      width=600;
    }else{
      width=context.getWidth();
    }
  }
static double getIconSize(double percentFromScreen){
return width*percentFromScreen/100;
  }

}