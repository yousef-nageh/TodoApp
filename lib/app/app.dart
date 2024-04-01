

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:todo_app/core/config/routes/app_routes.dart';
import 'package:todo_app/core/config/theme/app_theme.dart';
import 'package:todo_app/features/home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/theme_cubit/theme_state.dart';

import 'class/app_localization.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key, this.themeCache, this.languageCache});
final bool? themeCache;
final bool? languageCache;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) =>ThemeCubit()..setIsDark(cacheValue: themeCache)..setIsEnglish(cacheValue:languageCache ),
        child: BlocBuilder<ThemeCubit,ThemeStates>(builder: (BuildContext context, state) {

          return MaterialApp(

          locale:  ThemeCubit.getInstance(context).setLanguageMode(),
          builder: DevicePreview.appBuilder,
          supportedLocales: const [
            Locale("en"),
            Locale("ar"),
          ],
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // localeResolutionCallback: (deviceLocale,supportedLocales){
          //   for(var supportedLocale in supportedLocales ){
          //     if(deviceLocale !=null && deviceLocale.languageCode ==supportedLocale.languageCode ){
          //       return deviceLocale;
          //     }
          //   }
          //   return supportedLocales.first;
          //
          //
          // },
            //set language as mobile has

          initialRoute: AppRoutes.splashRoute,
          onGenerateRoute: GenerateRoutes.oGenerateRoutes,
          theme: AppTheme.lightTheme(context),
          darkTheme: AppTheme.darkTheme(context),
          themeMode: ThemeCubit.getInstance(context).setThemeMode(),
          debugShowCheckedModeBanner: false,


        );
        },

        ),


    );
  }
}
