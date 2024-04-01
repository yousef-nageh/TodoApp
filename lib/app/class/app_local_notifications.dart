import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:todo_app/core/config/extension.dart';
import 'package:todo_app/core/util/app_string.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void onTap(NotificationResponse response) {}

  static Future<void> init() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/launcher_icon"),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveBackgroundNotificationResponse: onTap,
        onDidReceiveNotificationResponse: onTap);
  }

  static Future<void> simpleNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      "id0",
      "simple NNotification",
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
        0, " simple title", "body", details);
  }

  static Future<void> repeatedNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      "id0",
      "repeated NNotification",
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0, " repeated title", "body", RepeatInterval.everyMinute, details);
  }

  static Future<void> scheduledNotification({
    required int id,
    required String body,
    required String date,
    required String time,
    required BuildContext context,

  }) async {

    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      "id0",
      "repeated NNotification",
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        AppString.forgetTask.tr(context),
        body,
        tz.TZDateTime(
          tz.local,
            getYearFromDate(date,2),
            getYearFromDate(date,0),
            getYearFromDate(date,1),
            getHoursFromTimeString(time),
            getMinutesFromTimeString(time)

        ),
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
  static void cancelNotification(int id){
    flutterLocalNotificationsPlugin.cancel(id);
  }
 static int getYearFromDate(String dateString,int item) {
    // Parse the date string into individual components
    List<String> components = dateString.split('/');

    // Extract the year from the components
    int year = int.parse(components[item]);

    // Return the year
    return year;
  }
 static int getMinutesFromTimeString(String timeString) {
    // Split the time string by colon and space to separate hours, minutes, and AM/PM
    List<String> timeComponents = timeString.split(':');
    List<String> minutesAndMeridiem = timeComponents[1].split(' ');

    // Extract the minutes from the time string
    int minutes = int.parse(minutesAndMeridiem[0]);

    // Return the minutes
    return minutes;
  }
 static int getHoursFromTimeString(String timeString) {
    // Split the time string by colon and space to separate hours, minutes, and AM/PM
    List<String> timeComponents = timeString.split(':');
    List<String> minutesAndMeridiem = timeComponents[1].split(' ');

    // Extract the hours from the time string
    int hours = int.parse(timeComponents[0]);

    // If the time is PM and not 12, add 12 to the hours to convert it to 24-hour format
    if ((minutesAndMeridiem[1] == 'PM' ||minutesAndMeridiem[1] == 'م') && hours != 12) {
      hours += 12;
    }

    // If the time is AM and 12, set hours to 0 (midnight)
    if ((minutesAndMeridiem[1] == 'AM'||minutesAndMeridiem[1]=="ص") && hours == 12) {
      hours = 0;
    }

    // Return the hours
    return hours;
  }
}
