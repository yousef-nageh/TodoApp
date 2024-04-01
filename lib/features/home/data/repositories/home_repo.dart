
import '../models/home_notes_model.dart';

abstract class HomeRepo {
  Future<HomeNotesList> getData();
  Future<int> addData({required String title, required String time, required String date,required String data});
  Future<int> updateData({required int id,required String whatUpdate});
  Future<int> deleteData({required int id});

}