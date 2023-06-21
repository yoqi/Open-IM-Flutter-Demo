import 'package:get/get.dart';

class VoiceCall2Controller extends GetxController {
  RxString toUid = "".obs;
  RxString toName = "".obs;
  RxString toAvatar = "".obs;

  var dragStartX = 0.0;
  var dragDistance = 0.0;
  var isAnswering = false;
  var isMKFOn = false; //开启麦克风
  var isSpearchOn = false;

  var isCallOrAnser = true; // 接电话还是打电话

  @override
  void onInit() {
    super.onInit();
    toUid.value = Get.parameters["toUid"] ?? "";
    toName.value = Get.parameters["toName"] ?? "";
    toAvatar.value = Get.parameters["toAvatar"] ?? "";
  }

  void hangUp() {}

  void accept() {}
}
