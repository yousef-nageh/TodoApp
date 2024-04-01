

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_state.dart';

import 'home_button_sheet_builder.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.getInstance(context);
        return FloatingActionButton(
          onPressed: () {
            if (cubit.isBottomShow) {
             cubit.validForm(context);
            } else {
              cubit.reverseIsBottomShow();
              cubit.scaffoldKey.currentState
                  ?.showBottomSheet(
                constraints: const BoxConstraints(
                    minWidth: double.infinity
                ),

                    (context) => const HomeBottomSheetBuilder(),
              )
                  .closed
                  .then((value) =>
                  cubit.reverseIsBottomShow(),
              );
            }
          },
          child: Icon(cubit.setFloatingIcon()),);
      },
    );
  }
}
