import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/config/extension.dart';
import 'package:todo_app/core/util/app_color.dart';
import 'package:todo_app/core/util/app_string.dart';

import 'package:todo_app/core/util/app_style.dart';
import 'package:todo_app/core/util/constant.dart';

import 'package:todo_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_state.dart';


import '../../../../app/functions/toast_msg.dart';
import '../widgets/drawer_item.dart';
import '../widgets/home_floating_action_button.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.getInstance(context);
    return BlocListener<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {
        if (state is AddToListSuccessState) {
          Navigator.pop(context);


          Future.delayed(const Duration(milliseconds: 500)).then((value) {
            cubit.titleTest.clear();
            cubit.dateTest.clear();
            cubit.timeTest.clear();
          });
        }else if(state is DateError ){
          toastMsg(state.mass,AppColor.red);


        }
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text(
            AppString.addTasks.tr(context),
            style: AppStyle.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
          titleSpacing: kPadding,
        ),
        key: cubit.scaffoldKey,
        floatingActionButton: const HomeFloatingActionButton(),
        drawer: Drawer(
          width: 65.w(),
          child: const DrawerItem(),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
