import 'package:get/get.dart';

import '../controllers/show_search_controller.dart';

class ShowSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowSearchController>(
      () => ShowSearchController(),
    );
  }
}
