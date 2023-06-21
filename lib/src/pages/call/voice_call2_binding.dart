import 'package:get/get.dart';
import 'package:openim_demo/src/pages/call/voice_call_controller.dart';

import 'voice_call2_controller.dart';

/// 接电话
class VoiceCall2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoiceCall2Controller());
  }
}
