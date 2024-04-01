import 'package:flutter/material.dart';
import 'package:todo_app/core/util/size_config.dart';

import '../widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {


     SizeConfig.init(context);
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
