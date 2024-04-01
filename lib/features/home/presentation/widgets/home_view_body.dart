
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:todo_app/features/home/presentation/widgets/list_empty.dart';

import 'notes_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    HomeCubit cubit = HomeCubit.getInstance(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        if (cubit.homeNotesList?.homeNotesList.isNotEmpty ==true) {
          return const NotesList();
        } else if (state is GetDataWaitingState) {
          return const Center(child:  CircularProgressIndicator());
        } else {
          return const ListEmpty();
        }
      },
    );
  }
}
