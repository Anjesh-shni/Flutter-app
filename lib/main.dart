import 'package:flutter/material.dart';
import 'package:zunun/services/dependency.dart' as depp;
import 'app/core/my_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  //It is general convention to load all the depencency before app run
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await depp.init();
  Map<String, Map<String, String>> languages = await depp.initLang();
  runApp(MyApp(languages: languages));
}
