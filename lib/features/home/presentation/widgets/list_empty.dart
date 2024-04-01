import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:todo_app/app/widget/height_sized_box.dart';
import 'package:todo_app/core/config/extension.dart';
import 'package:todo_app/core/util/app_image.dart';
import 'package:todo_app/core/util/app_string.dart';
import 'package:todo_app/core/util/app_style.dart';
import 'package:todo_app/core/util/size_config.dart';

import '../../../../core/util/app_color.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeightSizedBox(height: 10),
          SizedBox(
            height: 0.5 * SizeConfig.height,
            child: AspectRatio(
                aspectRatio: 1, child: Lottie.asset(AppImage.noTask)),
          ),
          Text(
            textAlign: TextAlign.center,
            AppString.noTask.tr(context).toUpperCase(),
            style: AppStyle.textStyle18
                .copyWith(color: AppColor.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
