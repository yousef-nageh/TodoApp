import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/config/extension.dart';
import 'package:todo_app/core/util/app_string.dart';
import 'package:todo_app/core/util/app_style.dart';
import 'package:todo_app/core/util/constant.dart';
import 'package:todo_app/features/home/presentation/manager/theme_cubit/theme_state.dart';

import '../manager/theme_cubit/theme_cubit.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state) {
            ThemeCubit cubit = ThemeCubit.getInstance(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.themeMode.tr(context),
                      style: AppStyle.textStyle15,
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                          value: ThemeCubit.getInstance(context).isDark,
                          onChanged: (value) {
                            ThemeCubit.getInstance(context)
                                .setIsDark(value: value);
                          }),
                    ),
                  ],
                ),
                Text(
                  AppString.language.tr(context),
                  style: AppStyle.textStyle15,
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  value: true,
                  groupValue: cubit.isEnglish,
                  onChanged: (bool? value) {
                    cubit.setIsEnglish(value: value);
                  },
                  title: Text(
                    AppString.english.tr(context),
                    style: AppStyle.textStyle16,
                  ),
                ),
                RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  value: false,
                  groupValue: cubit.isEnglish,
                  onChanged: (bool? value) {
                    cubit.setIsEnglish(value: value);
                  },
                  title: Text(
                    AppString.arabic.tr(context),
                    style: AppStyle.textStyle16,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
