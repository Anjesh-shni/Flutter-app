import 'package:get/get.dart';

import '../controllers/watch_lesson_controller.dart';

class WatchLessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchLessonController>(
      () => WatchLessonController(courseListRepo: Get.find()),
    );
  }
}
