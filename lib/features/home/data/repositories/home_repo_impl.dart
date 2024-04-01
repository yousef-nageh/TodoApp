import 'package:todo_app/app/class/sql_database.dart';

import '../models/home_notes_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final SqlDatabase sqlDatabase;

  HomeRepoImpl(this.sqlDatabase);

  @override
  Future<int> addData(
      {required String title,
      required String time,
      required String date,
      required String data}) async {
    var response = await sqlDatabase.insertToDatabase(
        addWhat:
            'INSERT INTO tasks(title,date,time,data) VALUES("$title","$date","$time","$data")');
    return response;
  }

  @override
  Future<int> deleteData({required int id})  async{
    var response=await sqlDatabase.deleteFromDatabase(deleteWhat: 'DELETE FROM tasks WHERE id = $id' );
    return response;

  }



  @override
  Future<int> updateData({required int id, required String whatUpdate}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<HomeNotesList> getData() async{
    var response =await sqlDatabase.getDataBase(getWhat: "SELECT * FROM tasks");
    HomeNotesList homeNotesList=HomeNotesList.fromJson(response);
    return homeNotesList;

  }
}
