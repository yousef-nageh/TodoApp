import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/config/extension.dart';

import 'package:todo_app/core/util/app_style.dart';
import 'package:todo_app/features/home/data/models/home_notes_model.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/theme_cubit/theme_state.dart';

import '../../../../app/class/app_local_notifications.dart';
import '../../../../app/functions/warning_dialog.dart';
import '../../../../app/widget/height_sized_box.dart';
import '../../../../app/widget/my_icon_button.dart';
import '../../../../core/util/app_color.dart';
import '../../../../core/util/constant.dart';

class NotesItemBuilder extends StatelessWidget {
  const NotesItemBuilder({
    super.key,
    required this.model,
  });

  final HomeNotesModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
      builder: (context, state) {
        ThemeCubit cubit = ThemeCubit.getInstance(context);
        return Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 9.6.w(),
                          child: Text(
                            maxLines: 1,
                            cubit.convertNumbersToArabic(model.time.toString()),
                            style: AppStyle.textStyle15.copyWith(color: AppColor.white),
                          ),
                        ),
                        const SizedBox(
                          width: kPadding,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              model.title.toString(),
                              style: AppStyle.textStyle15.copyWith(height: 2),
                            ),
                            Text(
                              cubit.convertDate(model.date.toString()),
                              style: AppStyle.textStyle16
                                  .copyWith(color: AppColor.grey),
                            ),
                          ],
                        )),
                        MyIconButton(
                          onPressed: () {
                            showWarningDialog(context, () {
                              Navigator.pop(context);
                              HomeCubit.getInstance(context)
                                  .removeFromList(model, model.id);
                              LocalNotificationService.cancelNotification(
                                  model.id);
                            });
                          },
                          iconData: Icons.delete_forever,
                          color: AppColor.red,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const HeightSizedBox(height: 1)
          ],
        );
      },
    );
  }
}
