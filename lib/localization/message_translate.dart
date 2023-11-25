import 'package:get/get.dart';

class Messages extends Translations {
  //This class is used tell how to store lang all together in device
  //Translation itself coming from getx
  //Bcz we are storing lang in Map format,
  final Map<String, Map<String, String>> languages;
  Messages({
    required this.languages,
  });

  @override
  Map<String, Map<String, String>> get keys {
    return languages;
  }
}
