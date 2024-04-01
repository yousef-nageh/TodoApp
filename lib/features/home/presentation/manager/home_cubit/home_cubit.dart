import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/class/app_local_notifications.dart';
import 'package:todo_app/core/config/extension.dart';
import 'package:todo_app/core/util/app_string.dart';
import 'package:todo_app/features/home/data/models/home_notes_model.dart';

import 'package:todo_app/features/home/data/repositories/home_repo.dart';
import 'package:todo_app/features/home/presentation/widgets/notes_item_builder.dart';

import '../../../../../app/functions/get_list_index.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  static HomeCubit getInstance(BuildContext context) =>
      BlocProvider.of(context);
  HomeRepo homeRepo;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomShow = false;
  var titleTest = TextEditingController();
  var timeTest = TextEditingController();
  var dateTest = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final listKey = GlobalKey<AnimatedListState>();
  final controller = ScrollController();

  HomeNotesList? homeNotesList;

  void reverseIsBottomShow() {
    isBottomShow = !isBottomShow;

    emit(ShowBottomSheetState());
  }

  IconData setFloatingIcon() {
    if (isBottomShow) {
      return Icons.add;
    }
    return Icons.edit;
  }

  void validForm(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      int index = homeNotesList!.homeNotesList.length+1;

      LocalNotificationService.scheduledNotification(
          id: index,
          body: titleTest.text,
          date: dateTest.text,
          time: timeTest.text,
      context: context).then((value) => addToList()).catchError((error){
           emit(DateError(mass: AppString.timeError.tr(context)));

      });



    }
  }

//***********************************************************
  Future<void> addToList() async {
    await homeRepo.addData(
        title: titleTest.text,
        time: timeTest.text,
        date: dateTest.text,
        data: "data");
    await getList();

    int index = homeNotesList!.homeNotesList.length - 1;


    listKey.currentState?.insertItem(index);
    goToLast();
    emit(AddToListSuccessState());
  }

  void goToLast() {
    Future.delayed(const Duration(milliseconds: 300)).then((value) =>
        controller.animateTo(controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn));
  }

  Future<void> removeFromList(model, int removedItem) async {
    int test = indexOfMapItem(homeNotesList!.homeNotesList, removedItem);

    await homeRepo.deleteData(id: removedItem);
    await getList();

    listKey.currentState?.removeItem(
        test,
        (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: NotesItemBuilder(
                model: model,
              ),
            ));
    emit(RemoveFromListSuccessState());
  }

  Future<void> getList() async {
    emit(GetDataWaitingState());
    var result = await homeRepo.getData();
    homeNotesList = result;

    emit(GetDataSuccessState());
  }
}
