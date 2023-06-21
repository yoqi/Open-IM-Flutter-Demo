import 'package:get/get.dart';

class VoiceCallController extends GetxController {
  RxString toUid = "".obs;
  RxString toName = "".obs;
  RxString toAvatar = "".obs;

  // get param from route
  @override
  void onInit() {
    super.onInit();
    toUid.value = Get.parameters["toUid"] ?? "";
    toName.value = Get.parameters["toName"] ?? "";
    toAvatar.value = Get.parameters["toAvatar"] ?? "";
  }
}
