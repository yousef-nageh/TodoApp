

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDatabase {

 static Database? _database;
 Future<Database?> get database async{
    _database ??= await initialDatabase() ;
    return _database;
  }

 Future<Database> initialDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "todo.db");
    Database database =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }
  Future<void> _onCreate(Database database, int version) async {
    try {
      await database.execute('''
 CREATE TABLE tasks (
 id INTEGER PRIMARY KEY ,
 title TEXT,
 date TEXT,
  time TEXT,
  data TEXT
 )
 ''');
      if (kDebugMode) {
        print("database Created *****************************");
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }
 Future<List<Map>> getDataBase({required String getWhat}) async{
   Database? myDatabase= await database;
   var response= await myDatabase!.rawQuery(getWhat);
   return response;
  }
 Future<int> insertToDatabase({required String addWhat}) async{
   Database ? myDatabase= await database;
   var response= await myDatabase!.rawInsert(addWhat);
   return response;
  }
  Future<int> updateFromDatabase({required String updateWhat}) async{
    Database ? myDatabase= await database;
    var response= await myDatabase!.rawUpdate(updateWhat);
    return response;
  }
  Future<int> deleteFromDatabase({required String deleteWhat}) async{
    Database ? myDatabase= await database;
    var response= await myDatabase!.rawDelete(deleteWhat);
    return response;
  }
}


