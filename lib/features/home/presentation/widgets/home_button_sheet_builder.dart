import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/widget/my_text_form_field.dart';

import 'package:todo_app/core/util/app_string.dart';

import 'package:todo_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_state.dart';

import '../../../../app/functions/select_time_and_data.dart';
import '../../../../core/util/constant.dart';

class HomeBottomSheetBuilder extends StatelessWidget {
  const HomeBottomSheetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.getInstance(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.only(
              left: kPadding, right: kPadding, top: kPadding),
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MYTextFormField(
                        iconData: Icons.title_outlined,
                        hintText: AppString.titleHint,
                        labelText: AppString.titleLabel,
                        controller: cubit.titleTest,
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: kPadding,
                    ),
                    MYTextFormField(
                        noTap: () {
                          getTime(context).then((value) => cubit.timeTest.text =value??""
                            );
                        },
                        iconData: Icons.watch_later_outlined,
                        hintText: AppString.timeHint,
                        labelText: AppString.timeLabel,
                        controller: cubit.timeTest,
                        keyboardType: TextInputType.none),
                    const SizedBox(
                      height: kPadding,
                    ),
                    MYTextFormField(
                        noTap: () {
                          getDate(context).then((value) => cubit.dateTest.text =value??"");

                        },
                        iconData: Icons.date_range,
                        hintText: AppString.dateHint,
                        labelText: AppString.dateLabel,
                        controller: cubit.dateTest,
                        keyboardType: TextInputType.none),
                    const SizedBox(
                      height: kPadding,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
