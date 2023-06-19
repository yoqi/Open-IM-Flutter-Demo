import 'package:get/get.dart';
import 'package:openim_demo/src/pages/notify/consulting_message_controller.dart';

class ConsultingMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConsultingMessageController());
  }
  
}