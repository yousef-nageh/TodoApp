import 'package:flutter/material.dart';
import 'package:todo_app/app/class/app_localization.dart';
import 'package:todo_app/core/util/size_config.dart';
extension NavigateToExtension on BuildContext {
  navigateTo( {required String pageName, Object? arguments}) =>
      Navigator.of(this).pushNamed(pageName, arguments: arguments);
}

extension NavigatorPopExtension on BuildContext {
  popTo() => Navigator.of(this).pop();
}

extension NavigateReplacementExtension on BuildContext {
  navigateToReplacement({required String pageName}) =>
      Navigator.of(this).pushReplacementNamed(pageName);
}

extension ScreenHeight on BuildContext {
  double getHeight() {
    Orientation orientation =MediaQuery.of(this).orientation;
    if(orientation ==Orientation.landscape){
      return MediaQuery.sizeOf(this).width;
    }else{
      return  MediaQuery.sizeOf(this).height;
    }

  }
}
extension ScreenWidth on BuildContext {
  double getWidth() => MediaQuery.sizeOf(this).width;
}
extension TranslateLanguage on String{

 String tr(BuildContext context)=>AppLocalization.of(context)!.translate(this);
}
extension ScreenHeightRatio on num{
  double h()=>this*SizeConfig.height/100;

}
extension ScreenWidthRatio on num{
  double w()=>this*SizeConfig.width/100;

}