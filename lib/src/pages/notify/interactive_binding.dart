import 'package:get/get.dart';
import 'package:openim_demo/src/pages/notify/interactive_controller.dart';

class InteractiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InteractiveController());
  }
}
