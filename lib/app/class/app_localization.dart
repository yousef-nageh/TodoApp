import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalization{
  final Locale? locale;

  AppLocalization(this.locale);

  static AppLocalization? of (BuildContext context){
    return Localizations.of<AppLocalization>(context,AppLocalization);
  }
  static const LocalizationsDelegate <AppLocalization> delegate =AppLocalizationDelegate();

  late Map<String,String> _localizedString;
Future loadJsonLanguage () async{
    String jsonString=await rootBundle.loadString("assets/json/${locale!.languageCode}.json");
    Map<String,dynamic> jsonMap=json.decode(jsonString);
    _localizedString =jsonMap.map((key, value) {

      return MapEntry(key, value.toString());
    });
}
String translate(String key)=>_localizedString[key]??"";
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
 const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["en","ar"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale)async {
    AppLocalization appLocalization=AppLocalization(locale);
    await appLocalization.loadJsonLanguage();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>false;

}