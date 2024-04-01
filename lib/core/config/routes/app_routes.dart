import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/functions/dependency_injection .dart';
import 'package:todo_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';

import '../../../features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const String splashRoute = "/";
  static const String homeRoute = "homeView";
}

abstract class GenerateRoutes {
  static Route<dynamic> oGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) {
              return const SplashView();
            });
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                create: (BuildContext context) =>
                    HomeCubit(getIt.get<HomeRepoImpl>())..getList(),
                child: const HomeView(),
            ));
      default:
        return GenerateRoutes.noRouteFound();
    }
  }

  static Route<dynamic> noRouteFound() {
    return MaterialPageRoute(
        builder: (BuildContext context) => const Scaffold(
              body: Center(child: Text("noRouteFound")),
            ));
  }
}
