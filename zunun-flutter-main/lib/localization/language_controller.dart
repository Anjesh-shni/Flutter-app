import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/domain/model/language_model/language_model.dart';
import 'package:zunun/utils/language_constant/language_constant.dart';

class LocalizationController extends GetxController implements GetxService {
  ///created controller and extens GetxService bcz i want it to save long time ina memory,

  //Storage
  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  //this is directly coming from dart UI package
  Locale _locale = Locale(
    //Oth index means default language,
    LanguageConstant.language[1].languageCode,
    LanguageConstant.language[1].countryCode,
  );
  //getter
  Locale get locale => _locale;

  //To switch between language in UI
  int _selectedIndex = 0;
  int get selectedInex => _selectedIndex;

  //using this variable we can change lang in UI
  List<LanguageModel> _langauage = [];
  List<LanguageModel> get language => _langauage;

  //This method get called in this class constructor
  void loadCurrentLanguage() async {
    //Only gets called during installation or rebot
    _locale = Locale(
      //This locale read info from storage if not there take default one,
      sharedPreferences.getString(LanguageConstant.LANGUAGE_CODE) ??
          LanguageConstant.language[0].languageCode,
      sharedPreferences.getString(LanguageConstant.COUNTRY_CODE) ??
          LanguageConstant.language[0].countryCode,
    );

    //checking lang list via loop
    for (int index = 0; index < LanguageConstant.language.length; index++) {
      if (LanguageConstant.language[index].languageCode ==
          _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _langauage = [];
    _langauage.addAll(LanguageConstant.language);
    update();
  }

  //For Chose language
  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    saveLangugage(_locale);
    update();
  }

  //For language Index change
  void selectedlangIndex(int index) {
    _selectedIndex = index;
    update();
  }

  //For saving language
  void saveLangugage(Locale locale) async {
    sharedPreferences.setString(
        LanguageConstant.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(
        LanguageConstant.COUNTRY_CODE, locale.countryCode!);
  }
}
