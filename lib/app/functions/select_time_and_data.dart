import 'package:flutter/material.dart';

import 'package:intl/intl.dart';



Future<String?> getTime(BuildContext context) async {
  final data =
      await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
  if (context.mounted) {
    return data?.format(context).toString();
  }
  return null;
}

Future<String?> getDate(BuildContext context) async {
  final data = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.parse("2040-07-18"),

     


    builder:  (BuildContext context, Widget? child)=>Center(
      child:  SizedBox(
        height: MediaQuery.sizeOf(context).height*0.8,
        width: MediaQuery.sizeOf(context).width*0.8,
        child: child,
      ),
    ),
  );

  if (data != null) {
    return DateFormat.yMd().format(data,).toString();
  }
  return null;
}

