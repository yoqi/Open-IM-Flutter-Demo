import 'package:get/get.dart';
import 'package:openim_demo/src/pages/notify/order_message_controller.dart';

class OrderMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderMessageController());
  }
}
