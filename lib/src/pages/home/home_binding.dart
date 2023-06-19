import 'package:get/get.dart';
import 'package:openim_demo/src/pages/contacts/contacts_logic.dart';
import 'package:openim_demo/src/pages/conversation/conversation_logic.dart';
import 'package:openim_demo/src/pages/mine/mine_logic.dart';
import 'package:openim_demo/src/pages/notify/message_controller.dart';
import 'package:openim_demo/src/pages/workbench/workbench_logic.dart';

import 'home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => ConversationLogic());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => ContactsLogic());
    Get.lazyPut(() => MineLogic());
    Get.lazyPut(() => WorkbenchLogic());
  }
}
