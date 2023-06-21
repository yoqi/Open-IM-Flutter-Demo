import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openim_demo/src/pages/call/voice_call2_controller.dart';

/// 接电话
class VoiceCall2Page extends StatelessWidget {
  VoiceCall2Page({Key? key}) : super(key: key);
  final logic = Get.find<VoiceCall2Controller>();
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
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    if (logic.isCalling)
                      Text(
                        "等待对方接通…",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    else
                      Text(
                        "17:03",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                  ],
                ),
              )),
          Positioned(bottom: 122, child: buildBottomView(context))
        ],
      )),
    );
  }

  buildBottomView(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 319,
          height: 80,
          margin: EdgeInsets.only(right: 28, left: 28),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Color(0x00000000), Color(0x99000000)]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  logic.switcMicrophone(context);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: logic.isMKFOn
                      ? Image.asset(
                          "assets/images/voicetelephone-on-mic-button.png",
                          width: 64,
                          height: 64,
                        )
                      : Image.asset(
                          "assets/images/voicetelephone-off-mic-button.png",
                          width: 64,
                          height: 64,
                        ),
                ),
              ),
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
                    logic.switchSpeach();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: logic.isSpearchOn == true
                        ? Image.asset(
                            "assets/images/voicetelephone-on-speaker-button.png",
                            width: 64,
                            height: 64,
                          )
                        : Image.asset(
                            "assets/images/voicetelephone-receiver-button.png",
                            width: 64,
                            height: 64,
                          ),
                  ))
            ],
          ),
        ),
        Container(
          width: 319,
          height: 40,
          margin: EdgeInsets.only(right: 28, left: 28),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (logic.isMKFOn)
                Text(
                  "麦克风已开",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              else
                Text(
                  "麦克风已关",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              Text(
                "挂断",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              if (logic.isSpearchOn)
                Text(
                  "扬声器",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              else
                Text(
                  "听筒",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
            ],
          ),
        )
      ],
    );
  }
}
