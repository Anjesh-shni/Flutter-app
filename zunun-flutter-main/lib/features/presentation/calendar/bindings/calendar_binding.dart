import 'package:get/get.dart';
import '../../create_event/controller/create_event_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEventController>(
      () => CreateEventController(createEventRepo: Get.find()),
    );
  }
}
