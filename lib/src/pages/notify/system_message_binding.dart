import 'package:get/get.dart';

import 'system_message_controller.dart';
class SystemMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SystemMessageController());
  }
}