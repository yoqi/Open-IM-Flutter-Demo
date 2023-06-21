import 'package:get/get.dart';
import 'package:openim_demo/src/pages/call/voice_call_controller.dart';

class VoiceCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoiceCallController());
  }
  
}