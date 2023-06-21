import 'package:get/get.dart';
import 'package:openim_demo/src/pages/call/video_call2_controller.dart';

class VideoCall2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoCall2Controller>(() => VideoCall2Controller());
  }
}
