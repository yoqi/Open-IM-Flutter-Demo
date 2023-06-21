import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/pages/call/voice_call_controller.dart';

class VoiceCallPage extends StatelessWidget {
  VoiceCallPage({Key? key}) : super(key: key);
  final logic = Get.find<VoiceCallController>();
  Size get _size => MediaQuery.of(Get.context!).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Image.asset(
            "assets/images/ic_login_bg.webp",
            width: _size.width,
            height: _size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 160,
              child: Container(
                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "assets/images/iocn_logo_default2.jpg",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Image.network(
                    //   "assets/images/iocn_logo_default2.jpg",
                    //   width: 100,
                    //   height: 100,
                    // ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "往事随风",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "语音通话",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
              )),
          Positioned(bottom: 122, child: buildBottomView())
        ],
      )),
    );
  }

  // 左右两边的按钮，左边挂断，右边接听，滑动到右边接听，滑动到左边挂断
  buildBottomView() {
    return Container(
      width: _size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              logic.hangUp();
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Image.asset(
                "assets/images/voicetelephone-hangup-button.png",
                width: 64,
                height: 64,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              logic.accept();
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Image.asset(
                "assets/images/voicetelephone-answerthephone-button.png",
                width: 64,
                height: 64,
              ),
            ),
          )
        ],
      ),
    );
  }
}
