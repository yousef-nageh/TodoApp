import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/presentation/manager/home_cubit/home_state.dart';

import '../manager/home_cubit/home_cubit.dart';
import 'notes_item_builder.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});


  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<HomeCubit,HomeStates>(
      builder: (BuildContext context, state) {
        HomeCubit cubit=  HomeCubit.getInstance(context);
        return AnimatedList(

        controller: cubit.controller,
        key:cubit.listKey,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
            SizeTransition(
              sizeFactor: animation,
              child: NotesItemBuilder(
                model: cubit.homeNotesList!.homeNotesList[index],

              ),
            ),
        initialItemCount:  cubit.homeNotesList?.homeNotesList.length??0

      );
      },

    );
  }
}
