import 'dart:ui';


import 'package:todo_app/core/util/size_config.dart';

double getResponsiveFontSize(double fontSize,){
double scaleFactor=getScaleFactor( );
double responsiveFontSize=fontSize *scaleFactor;
double lowerLimit=fontSize *0.8;
double upperLimit=fontSize *1.4;

return responsiveFontSize.clamp(lowerLimit, upperLimit);



}

double getScaleFactor(){
 var dispatcher= PlatformDispatcher.instance;
var physicalWidth=  dispatcher.views.first.physicalSize.width;
var  devicePixelRatio= dispatcher.views.first.devicePixelRatio;


  double screenWidth=physicalWidth/devicePixelRatio;
// double screenWidth=MediaQuery.sizeOf(context).width;
  if(screenWidth<SizeConfig.mobileDevice){
    return screenWidth/400;
  }else{
    return screenWidth/700;
  }
}


// double testResponsiveFontSize(double fontSize,BuildContext context){
//   double scaleFactor=testScaleFactor( context );
//   double responsiveFontSize=fontSize *scaleFactor;
//   double lowerLimit=fontSize *0.8;
//   double upperLimit=fontSize *1.4;
// print(responsiveFontSize.clamp(lowerLimit, upperLimit));
//   return responsiveFontSize.clamp(lowerLimit, upperLimit);
//
//
//
// }

// double testScaleFactor(BuildContext context){
//   // var dispatcher= PlatformDispatcher.instance;
//   // var physicalWidth=  dispatcher.views.first.physicalSize.width;
//   // var  devicePixelRatio= dispatcher.views.first.devicePixelRatio;
//   //
//   //
//   // double screenWidth=physicalWidth/devicePixelRatio;
//  double screenWidth=MediaQuery.sizeOf(context).width;
//   if(screenWidth<SizeConfig.mobileDevice){
//     return screenWidth/400;
//   }else{
//     return screenWidth/700;
//   }
// }