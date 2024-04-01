class HomeNotesList{
late  List<HomeNotesModel> homeNotesList;

HomeNotesList.fromJson(List<dynamic> homeNotesList){
this.homeNotesList=homeNotesList.map((e) => HomeNotesModel.fromJson(e)).toList();

}

}


class HomeNotesModel{
 late int id;
late  String title;
 late String time;
 late String date;
 late  String  data;

  HomeNotesModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['title'];
    time=json['time'];
    date=json['date'];
    data=json['data'];

  }

}