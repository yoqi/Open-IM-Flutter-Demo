import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCall2Controller extends GetxController {
  RxString toUid = "".obs;
  RxString toName = "".obs;
  RxString toAvatar = "".obs;

  var dragStartX = 0.0;
  var dragDistance = 0.0;
  var isAnswering = false;
  var isMKFOn = false; //开启麦克风
  var isSpearchOn = false; //

  var isCalling = true; // 是否接通

  @override
  void onInit() {
    super.onInit();
    toUid.value = Get.parameters["toUid"] ?? "";
    toName.value = Get.parameters["toName"] ?? "";
    toAvatar.value = Get.parameters["toAvatar"] ?? "";
  }

  void call() {}

  void _initEngine() {
    //   _engine = createAgoraRtcEngine();
    // // 初始化 RtcEngine
    //   await _engine.initialize(RtcEngineContext(
    //   appId: appId,
    // ));
  }

  void hangUp() {}

  void accept() {}

  void switchSpeach() {
    if (isSpearchOn) {
      // 关闭麦克风
      // _engine.enableLocalAudio(false);
    } else {
      // 开启麦克风
      // _engine.enableLocalAudio(true);
    }
    isSpearchOn = !isSpearchOn;
  }

  void switcMicrophone(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("是否开启麦克风"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("确定")),
            ],
          );
        });
    if (isMKFOn) {
      // 关闭麦克风
      // _engine.enableLocalAudio(false);
    } else {
      // 开启麦克风
      // _engine.enableLocalAudio(true);
    }
    isMKFOn = !isMKFOn;
  }

  void openCamera() {}

  void changeCamera() {}
}
