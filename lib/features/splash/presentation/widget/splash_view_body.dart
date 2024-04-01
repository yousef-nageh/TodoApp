
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/config/extension.dart';
import 'package:todo_app/core/config/routes/app_routes.dart';
import 'package:todo_app/core/util/app_image.dart';



class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {

    super.initState();
    goToHome();
  }

  void goToHome(){
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if(mounted) {
        return context.navigateToReplacement(pageName: AppRoutes.homeRoute);
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {

    double h=context.getHeight();
    return  Center(
      child:
        Lottie.asset(AppImage.splashImage,height: h/2,fit: BoxFit.fill,repeat: false)

    );
  }
}
