import 'package:get/get.dart';
import 'package:openim_demo/src/pages/notify/shop_message_controller.dart';


class ShopMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopMessageController());
  }
}
