import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    if (logic.isCallOrAnser)
                      Text(
                        "等待对方接通…",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
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
              AnimatedPositioned(
                left: -logic.dragDistance,
                duration: Duration(milliseconds: 200),
                child: GestureDetector(
                  onHorizontalDragStart: (details) {
                    // 记录滑动开始时的位置
                    logic.dragStartX = details.globalPosition.dx;
                  },
                  onHorizontalDragUpdate: (details) {
                    // 根据水平滑动距离更新按钮位置
                    logic.dragDistance =
                        (logic.dragStartX - details.globalPosition.dx)
                            .clamp(0, 100); // 最大滑动距离设置为 100 像素
                  },
                  onHorizontalDragEnd: (details) {
                    // 如果滑动距离超过一定阈值，则执行挂断操作
                    if (logic.dragDistance > 30) {
                      logic.dragDistance = 100;
                      logic.isAnswering = false;
                    } else {
                      logic.dragDistance = 0;
                    }
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
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                right: -logic.dragDistance,
                child: GestureDetector(
                  onHorizontalDragStart: (details) {
                    // 记录滑动开始时的位置
                    logic.dragStartX = details.globalPosition.dx;
                  },
                  onHorizontalDragUpdate: (details) {
                    // 根据水平滑动距离更新按钮位置
                    logic.dragDistance =
                        (logic.dragStartX - details.globalPosition.dx)
                            .clamp(0, 100); // 最大滑动距离设置为 100 像素
                  },
                  onHorizontalDragEnd: (details) {
                    // 如果滑动距离超过一定阈值，则执行挂断操作
                    if (logic.dragDistance > 30) {
                      logic.dragDistance = 100;
                      logic.isAnswering = false;
                    } else {
                      logic.dragDistance = 0;
                    }
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
                ),
              )
            ],
          ),
        ),
        Container(
          width: 319,
          height: 40,
          margin: EdgeInsets.only(right: 28, left: 28),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "挂断",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                "接听",
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
