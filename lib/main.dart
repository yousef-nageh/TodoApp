import 'package:flutter/material.dart';
import 'package:todo_app/app/class/app_local_notifications.dart';

import 'package:todo_app/app/class/cache_helper.dart';

import 'app/app.dart';
import 'app/functions/dependency_injection .dart';
import 'core/util/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  await LocalNotificationService.init();
  sutUp();
  CacheHelper.themeValue = CacheHelper.getData(key: isDarkCache);
  CacheHelper.isEnglish=CacheHelper.getData(key: isEnglishCache);
  runApp(
    MyApp(themeCache: CacheHelper.themeValue,languageCache: CacheHelper.isEnglish ),
  );
}
