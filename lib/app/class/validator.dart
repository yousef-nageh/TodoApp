import 'package:todo_app/core/config/extension.dart';
import 'package:todo_app/core/util/app_string.dart';

class AppValidator{
  static String?  textValidator(String? value,context) {
    if(value?.isEmpty==true){
      return AppString.validatorTest.tr(context);
    }
    return null;
  }
}