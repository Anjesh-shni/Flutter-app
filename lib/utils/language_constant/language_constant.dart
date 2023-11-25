import 'package:zunun/features/domain/model/language_model/language_model.dart';

class LanguageConstant {
  //These variable used to store related language code in local storage
  static const String COUNTRY_CODE = "country_code";
  static const String LANGUAGE_CODE = "language_code";

  static List<LanguageModel> language = [
    //Created instasnce using language model
    //We need to work with locale as we save data, 
    //actually we need to read them using languageList,
    //bcz i dont wanna to aceess like countryCode one by one
    //this list is used to read language code and able change based on index
    LanguageModel(
        imgUrl: "es.png",
        languageName: "Spanish",
        languageCode: "es",
        countryCode: "ES"),
    LanguageModel(
        imgUrl: "en.png",
        languageName: "English",
        languageCode: "en",
        countryCode: "US"),
  ];
}
