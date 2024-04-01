
abstract class HomeStates {}

class HomeInitial extends HomeStates {}
class ShowBottomSheetState extends HomeStates {}
class AddToListSuccessState extends HomeStates {}
class RemoveFromListSuccessState extends HomeStates {}
class GetDataSuccessState extends HomeStates {}
class GetDataWaitingState extends HomeStates {}
class DateError extends HomeStates {
  final String mass;

  DateError({required this.mass});
}
