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
                    Image.asset(
                      "assets/images/ic_my_friend.webp",
                      width: 100,
                      height: 100,
                    ),
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
        ],
      )),
    );
  }
}
