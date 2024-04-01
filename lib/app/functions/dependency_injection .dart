import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/home_repo_impl.dart';
import '../class/sql_database.dart';

final getIt=GetIt.instance;
void sutUp(){
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(SqlDatabase()));
}