import 'package:flutter/material.dart';
import 'package:todo_app/core/config/extension.dart';

import '../../core/util/app_color.dart';
import '../../core/util/app_string.dart';
import '../../core/util/app_style.dart';
import '../../core/util/size_config.dart';
import '../widget/my_text_button.dart';

Future<void> showWarningDialog(
    BuildContext context, VoidCallback onPressed) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button to close dialog
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        actionsOverflowButtonSpacing: 20,
        title: Icon(
          Icons.info_outline_rounded,
          size: SizeConfig.getIconSize(7),
        ),
        content:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              AppString.ask.tr(context),
              style: AppStyle.textStyle18.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: <Widget>[
          MYTextButton(
            text: AppString.cancel.tr(context),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          MYTextButton(
            onPressed: onPressed,
            text: AppString.delete.tr(context),
            textColor: AppColor.red,
          ),
        ],
      );
    },
  );
}
