import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/class/cache_helper.dart';
import 'package:todo_app/features/home/presentation/manager/theme_cubit/theme_state.dart';

import '../../../../../core/util/constant.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit getInstance(context) => BlocProvider.of(context);
  bool isDark = false;
  bool isEnglish = true;

  void setIsEnglish({bool? value, bool? cacheValue}) {
    if (cacheValue != null) {
      isEnglish = cacheValue;
    } else {
      isEnglish = value ?? true;
      CacheHelper.setData(key: isEnglishCache, value: isEnglish);
    }
    emit(ChangeLanguageState());
  }

  Locale setLanguageMode() {
    if (isEnglish == false) {
      return const Locale("ar");
    }
    return const Locale("en");
  }

  void setIsDark({bool? value, bool? cacheValue}) {
    if (cacheValue != null) {
      isDark = cacheValue;
    } else {
      isDark = value ?? false;
      CacheHelper.setData(key: isDarkCache, value: isDark);
    }
    emit(ChangeThemeState());
  }

  ThemeMode setThemeMode() {
    if (isDark) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }


  String convertNumbersToArabic(String dateString) {
    Map<String, String> englishToArabic = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
      '/': '\\'

    };

    String arabicDate = dateString
        .split('')
        .map((char) => englishToArabic[char] ?? char)
        .join();

    return   isEnglish?dateString:arabicDate ;
  }
String convertDate(String? value){
    value??="";
    if(!isEnglish){
      return convertNumbersToArabic(value);
    }
    return value;
}

String getFontFamily(){

    if(isEnglish){
      return englishFont;
    }
    return arabicFont;
}
}
