import 'package:get/get.dart';
import 'package:openim_demo/src/pages/conversation/conversation_logic.dart';
import 'message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut(() => ConversationLogic());
  }
}
